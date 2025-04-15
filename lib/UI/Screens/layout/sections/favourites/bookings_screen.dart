import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class BookingsScreen extends StatefulWidget {
  const BookingsScreen({super.key});

  @override
  State<BookingsScreen> createState() => _BookingsScreenState();
}

class _BookingsScreenState extends State<BookingsScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  final List<Map<String, dynamic>> bookings = [
    {
      'date': DateTime(2024, 11, 9),
      'status': 'Booked',
      'title': 'Serenity Cruise',
      'endDate': DateTime(2024, 11, 10),
    },
    {
      'date': DateTime(2024, 11, 23),
      'status': 'Cancelled',
      'title': 'Tranquil Waters',
    },
  ];

  bool _isSameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;

  @override
  Widget build(BuildContext context) {
    return     Column(
        children: [
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
              selectedDayPredicate: (day) => _selectedDay != null && _isSameDay(day, _selectedDay!),
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
                  final isBooked = bookings.any((b) =>
                      date.isAfter(b['date'].subtract(const Duration(days: 1))) &&
                      (b['endDate'] != null ? date.isBefore(b['endDate'].add(const Duration(days: 1))) : true));

                  final isCancelled = bookings.any((b) => b['status'] == 'Cancelled' && _isSameDay(b['date'], date));

                  if (isBooked) {
                    return Container(
                      decoration: const BoxDecoration(
                        color: Color(0xffb8e8e1),
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: Text('${date.day}'),
                    );
                  }

                  if (isCancelled) {
                    return Container(
                      decoration: const BoxDecoration(
                        color: Color(0xffffd1d1),
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: Text('${date.day}'),
                    );
                  }

                  return null;
                },
              ),
            ),
          ),
          const SizedBox(height: 10),
          ...bookings.map((b) {
            bool isCancelled = b['status'] == 'Cancelled';
            return ListTile(
              leading: CircleAvatar(
                backgroundColor: isCancelled ? Colors.red[100] : Colors.teal[100],
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
                    ? 'Your booking for "${b['title']}" on ${DateFormat('MMM d, yyyy').format(b['date'])}, has been cancelled.'
                    : 'Your houseboat "${b['title']}" is booked for ${DateFormat('MMM d',).format(b['date'])}-${DateFormat('d, yyyy').format(b['endDate'])}.',
              ),
              trailing: const Icon(Icons.edit, size: 18),
            );
          }).toList(),
        ],
      )
   ;
  }
}
