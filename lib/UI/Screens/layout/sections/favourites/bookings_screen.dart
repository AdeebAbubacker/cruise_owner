import 'package:cruise_buddy/core/model/get_my_booking_list/get_my_booking_list.dart';
import 'package:cruise_buddy/core/view_model/seeMyBookingList/see_my_booking_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

import '../../../../../core/model/get_my_booking_list/datum.dart';

class BookingsScreen extends StatefulWidget {
  const BookingsScreen({super.key});

  @override
  State<BookingsScreen> createState() => _BookingsScreenState();
}

class _BookingsScreenState extends State<BookingsScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  Set<DateTime> bookedDates = {};

  bool _isSameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;
  @override
  void initState() {
    super.initState();
    // Fetch booking list from the BLoC
    BlocProvider.of<SeeMyBookingListBloc>(context)
        .add(SeeMyBookingListEvent.getBookingList());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SeeMyBookingListBloc, SeeMyBookingListState>(
      builder: (context, state) {
        List<BookingData> bookings = [];

        state.map(
          initial: (_) {},
          loading: (_) {},
          getuseruccess: (value) {
            bookings = value.userprofilemodel.data ?? [];
            // Clear old data
            bookedDates.clear();
            for (var booking in bookings) {
              if (booking.startDate == null || booking.endDate == null)
                continue;

              final start = DateTime.parse(booking.startDate.toString());
              final end = DateTime.parse(booking.endDate.toString());

              // Loop through date range and add to bookedDates
              for (DateTime day = start;
                  !day.isAfter(end);
                  day = day.add(const Duration(days: 1))) {
                bookedDates.add(day);
              }
            }
          },
          getuserFailure: (_) {},
          noInternet: (_) {},
        );

        return SingleChildScrollView(
          child: Column(
            children: [
              // Calendar view
              Container(
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)],
                ),
                child: TableCalendar(
                  firstDay: DateTime.utc(2020),
                  lastDay: DateTime.utc(2030),
                  focusedDay: _focusedDay,
                  selectedDayPredicate: (day) =>
                      _selectedDay != null && _isSameDay(day, _selectedDay!),
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay = focusedDay;
                    });
                  },
                  calendarFormat: CalendarFormat.month,
                  headerStyle: HeaderStyle(
                    formatButtonVisible: false,
                    titleCentered: true,
                  ),
                  calendarStyle: CalendarStyle(
                    todayDecoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      shape: BoxShape.circle,
                    ),
                    selectedDecoration: BoxDecoration(
                      color: Colors.teal,
                      shape: BoxShape.circle,
                    ),
                    markerDecoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                  calendarBuilders: CalendarBuilders(
                    defaultBuilder: (context, date, _) {
                      final isBooked = bookings.any((b) {
                        final rawStart = b.startDate.toString();
                        final rawEnd = b.endDate.toString();

                        if (rawStart == null) return false;

                        final startDate = DateTime.parse(rawStart);
                        final endDate =
                            rawEnd != null ? DateTime.parse(rawEnd) : startDate;

                        // Create date-only objects to ignore time
                        final dateOnly =
                            DateTime(date.year, date.month, date.day);
                        final startOnly = DateTime(
                            startDate.year, startDate.month, startDate.day);
                        final endOnly =
                            DateTime(endDate.year, endDate.month, endDate.day);

                        return dateOnly.isAtSameMomentAs(startOnly) ||
                            dateOnly.isAtSameMomentAs(endOnly) ||
                            (dateOnly.isAfter(startOnly) &&
                                dateOnly.isBefore(endOnly));
                      });

                      if (isBooked) {
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xffb8e8e1),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            alignment: Alignment.center,
                            child: Text('${date.day}'),
                          ),
                        );
                      }

                      return null;
                    },
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // Booking list
              state.maybeMap(
                orElse: () => Center(child: Text('No bookings available.')),
                loading: (value) {
                  return Center(child: CircularProgressIndicator());
                },
                getuseruccess: (value) {
                  bookings = value.userprofilemodel.data ?? [];
                  if (bookings.isEmpty) {
                    return Center(child: Text('No bookings available.'));
                  }
                  return Column(
                    children: bookings.map((b) {
                      bool isCancelled = b.fulfillmentStatus == 'Cancelled';
                      final startDate = DateFormat('MMM d')
                          .format(DateTime.parse(b.startDate.toString() ?? ''));
                      final endDate = b.endDate != null
                          ? DateFormat('d, yyyy')
                              .format(DateTime.parse(b.endDate.toString() ?? ''))
                          : '';
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor:
                              isCancelled ? Colors.red[100] : Colors.teal[100],
                          child: Icon(
                            isCancelled ? Icons.close : Icons.directions_boat,
                            color: isCancelled ? Colors.red : Colors.teal,
                          ),
                        ),
                        title: Text(
                          isCancelled ? 'Booking Cancelled' : 'Booked',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: isCancelled ? Colors.red : Colors.teal,
                          ),
                        ),
                        subtitle: Text(
                          isCancelled
                              ? 'Your booking on ${DateFormat('MMM d, yyyy').format(DateTime.parse(b.startDate.toString() ?? ''))} has been cancelled.'
                              : 'Your houseboat is booked for $startDate - $endDate.',
                        ),
                        trailing: const Icon(Icons.edit, size: 18),
                      );
                    }).toList(),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
