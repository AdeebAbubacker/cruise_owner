import 'package:cruise_buddy/UI/Widgets/toast/custom_toast.dart';
import 'package:cruise_buddy/core/db/hive_db/adapters/package_details_adapter/package_details_adapter.dart';
import 'package:cruise_buddy/core/db/hive_db/boxes/package_details_box.dart';
import 'package:cruise_buddy/core/model/get_my_booking_list/get_my_booking_list.dart';
import 'package:cruise_buddy/core/view_model/createBookingByOwner/create_booking_by_owner_bloc.dart';
import 'package:cruise_buddy/core/view_model/seeMyBookingList/see_my_booking_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
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
    return BlocListener<CreateBookingByOwnerBloc, CreateBookingByOwnerState>(
      listener: (context, state) {
        state.mapOrNull(
          getCruiseTypes: (value) {
           
               CustomToast.showFlushBar(
                    context: context,
                    status: true,
                    title: "COngrats",
                    content:
                       "Your booking has been locked",
                  );
          },
          getCruiseTypesFailure: (value) {
           

             CustomToast.showFlushBar(
                    context: context,
                    status: false,
                    title: "Oops",
                    content:
                       "Something went wrong",
                  );
          },
        );
      },
      child: BlocBuilder<SeeMyBookingListBloc, SeeMyBookingListState>(
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
                if (booking.startDate == null || booking.endDate == null) {
                  continue;
                }

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

          // Now you can use this properly in ValueListenableBuilder
          void showBookingDialog(BuildContext context) {
            PackageDetailsDB? selectedPackage;
            DateTime? selectedStart;
            DateTime? selectedEnd;
            Box<PackageDetailsDB> packageDetailsBox =
                Hive.box<PackageDetailsDB>('packageDetailsBox');

            showDialog(
              context: context,
              builder: (context) {
                return StatefulBuilder(
                  builder: (context, setState) {
                    return AlertDialog(
                      title: const Text("New Booking"),
                      content: SingleChildScrollView(
                        child: Column(
                          children: [
                            // Dropdown for packages
                            ValueListenableBuilder<Box<PackageDetailsDB>>(
                              valueListenable: packageDetailsBox.listenable(),
                              builder: (context, Box<PackageDetailsDB> box, _) {
                                final packages = box.values.toList();

                                return SizedBox(
                                  height: 100,
                                  child: DropdownButton<PackageDetailsDB>(
                                    isExpanded: true,
                                    isDense: true,
                                    value: selectedPackage,
                                    hint: const Text("Select a Package"),
                                    items: packages.map((pkg) {
                                      return DropdownMenuItem<PackageDetailsDB>(
                                        value: pkg,
                                        child: Row(
                                          children: [
                                            // Image
                                            if (pkg.cruiseImage != null)
                                              SizedBox(
                                                  width: 40,
                                                  height: 40,
                                                  child: Stack(
                                                    alignment: Alignment
                                                        .center, // Aligns both text and image in the center
                                                    children: [
                                                      // Image (Bottom Layer)
                                                      if (pkg.cruiseImage !=
                                                          null)
                                                        Image.network(
                                                          pkg.cruiseImage!,
                                                          width: 40,
                                                          height: 40,
                                                          fit: BoxFit.cover,
                                                        )
                                                      else
                                                        const Icon(
                                                            Icons
                                                                .image_not_supported,
                                                            size: 40),

                                                      // Package Name (Top Layer)
                                                      Positioned(
                                                        top:
                                                            0, // Position it at the top of the image
                                                        child: Text(
                                                          pkg.packageName ??
                                                              'No package name',
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .grey,
                                                                  fontSize: 12),
                                                          textAlign:
                                                              TextAlign.center,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          maxLines:
                                                              2, // Limits to 2 lines
                                                        ),
                                                      ),
                                                    ],
                                                  ))
                                            else
                                              const Icon(
                                                  Icons.image_not_supported,
                                                  size: 40),

                                            const SizedBox(width: 10),

                                            // Cruise Name and Package Name
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    pkg.cruiseName ??
                                                        'Unknown Cruise',
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    overflow: TextOverflow
                                                        .ellipsis, // Adds ellipsis when text overflows
                                                    maxLines:
                                                        2, // Limits the text to 2 lines
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (val) {
                                      setState(() => selectedPackage = val);
                                    },
                                    dropdownColor: Colors.white,
                                    itemHeight: 100.0,
                                  ),
                                );
                              },
                            ),

                            const SizedBox(height: 10),

                            // Start Date
                            ElevatedButton(
                              onPressed: () async {
                                final picked = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime(2030),
                                );
                                if (picked != null) {
                                  setState(() => selectedStart = picked);
                                }
                              },
                              child: Text(selectedStart == null
                                  ? "Pick Start Date"
                                  : "Start: ${DateFormat('yyyy-MM-dd').format(selectedStart!)}"),
                            ),

                            const SizedBox(height: 10),

                            // End Date
                            ElevatedButton(
                              onPressed: () async {
                                final picked = await showDatePicker(
                                  context: context,
                                  initialDate: selectedStart ?? DateTime.now(),
                                  firstDate: selectedStart ?? DateTime.now(),
                                  lastDate: DateTime(2030),
                                );
                                if (picked != null) {
                                  setState(() => selectedEnd = picked);
                                }
                              },
                              child: Text(selectedEnd == null
                                  ? "Pick End Date"
                                  : "End: ${DateFormat('yyyy-MM-dd').format(selectedEnd!)}"),
                            ),
                          ],
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("Cancel"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (selectedStart == null ||
                                selectedPackage == null) return;
                            // Extracting packageId, startDate, and endDate.
                            String packageId = selectedPackage!.packageId ??
                                ''; // Assuming packageId is a field of PackageDetailsDB.
                            String startDate =
                                DateFormat('yyyy-MM-dd').format(selectedStart!);
                            String? endDate = selectedEnd != null
                                ? DateFormat('yyyy-MM-dd').format(selectedEnd!)
                                : null;

                            BlocProvider.of<CreateBookingByOwnerBloc>(context)
                                .add(
                              CreateBookingByOwnerEvent.getCruiseTypes(
                                packageId: packageId,
                                bookingTypeId:
                                    '1', // Assuming bookingTypeId is '1' (this can be dynamic as well).
                                startDate: startDate,
                                endDate: endDate,
                              ),
                            );
                            Navigator.pop(context);
                          },
                          child: BlocBuilder<CreateBookingByOwnerBloc,
                              CreateBookingByOwnerState>(
                            builder: (context, state) {
                              return state.map(
                                initial: (value) {
                                  return const Text("Confirm");
                                },
                                loading: (value) {
                                  return const CircularProgressIndicator();
                                },
                                getCruiseTypes: (value) {
                                  return const Text("Confirm");
                                },
                                getCruiseTypesFailure: (value) {
                                  return const Text("Confirm");
                                },
                                noInternet: (value) {
                                  return const Text("Confirm");
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            );
          }

          return SingleChildScrollView(
            child: Column(
              children: [
                // Calendar view
                Row(
                  children: [
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 20,
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                4), // Circular border radius
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 12), // Optional: custom padding
                          backgroundColor: const Color.fromARGB(255, 231, 231,
                              231), // Optional: custom background color
                        ),
                        onPressed: () {
                          showBookingDialog(context);
                        },
                        child: const Text("Add Booking"),
                      ),
                    ),
                  ],
                ),

                Container(
                  margin: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(color: Colors.black12, blurRadius: 8)
                    ],
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

                          final startDate = DateTime.parse(rawStart);
                          final endDate = rawEnd != null
                              ? DateTime.parse(rawEnd)
                              : startDate;

                          // Create date-only objects to ignore time
                          final dateOnly =
                              DateTime(date.year, date.month, date.day);
                          final startOnly = DateTime(
                              startDate.year, startDate.month, startDate.day);
                          final endOnly = DateTime(
                              endDate.year, endDate.month, endDate.day);

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
                        final startDate = DateFormat('MMM d').format(
                            DateTime.parse(b.startDate.toString() ?? ''));
                        final endDate = b.endDate != null
                            ? DateFormat('d, yyyy').format(
                                DateTime.parse(b.endDate.toString() ?? ''))
                            : '';
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundColor: isCancelled
                                ? Colors.red[100]
                                : Colors.teal[100],
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
      ),
    );
  }
}
