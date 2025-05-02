// import 'package:cruise_buddy/core/view_model/createBookingByOwner/create_booking_by_owner_bloc.dart';
// import 'package:cruise_buddy/core/view_model/listOwnerpackages/listowner_packages_bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:syncfusion_flutter_datepicker/datepicker.dart';

// class ApiTest extends StatelessWidget {
//   const ApiTest({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             SizedBox(height: 100),
//             BlocBuilder<CreateBookingByOwnerBloc, CreateBookingByOwnerState>(
//               builder: (context, state) {
//                 return state.map(
//                   ownerBookingValiationFailure: (value) {
//                     return const Text("Confirm");
//                   },
//                   initial: (value) {
//                     return Text("0");
//                   },
//                   loading: (value) {
//                     return Text("0");
//                   },
//                   getCruiseTypes: (value) {
//                     return Text("${value.cruisetypemodel.toString()}");
//                   },
//                   getCruiseTypesFailure: (value) {
//                     return Text("0");
//                   },
//                   noInternet: (value) {
//                     return Text("0");
//                   },
//                 );
//               },
//             ),
//             SfDateRangePicker(
//               view: DateRangePickerView.month,
//               selectionMode: DateRangePickerSelectionMode.single,
//               initialSelectedDate: DateTime.now(),
//               onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
//                 final selectedDate = args.value as DateTime;
//                 // Handle selectedDate
//               },
//               showNavigationArrow: true,
//               monthViewSettings: DateRangePickerMonthViewSettings(
//                 showTrailingAndLeadingDates: true,
//               ),
//               headerStyle: DateRangePickerHeaderStyle(
//                 textAlign: TextAlign.center,
//                 textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//               ),
//               allowViewNavigation:
//                   true, // Enables tapping header to choose year/month
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class CustomCalendar extends StatefulWidget {
//   @override
//   _CustomCalendarState createState() => _CustomCalendarState();
// }

// class _CustomCalendarState extends State<CustomCalendar> {
//   DateTime? _selectedDate;
//   List<Booking> bookings = [
//     Booking(startDate: DateTime(2025, 5, 2), endDate: DateTime(2025, 5, 5)),
//     Booking(startDate: DateTime(2025, 5, 10)), // Single day booking
//   ];

//   bool _isBooked(DateTime date) {
//     return bookings.any((b) {
//       final start =
//           DateTime(b.startDate.year, b.startDate.month, b.startDate.day);
//       final end = b.endDate != null
//           ? DateTime(b.endDate!.year, b.endDate!.month, b.endDate!.day)
//           : start;
//       final checkDate = DateTime(date.year, date.month, date.day);
//       return checkDate.isAtSameMomentAs(start) ||
//           checkDate.isAtSameMomentAs(end) ||
//           (checkDate.isAfter(start) && checkDate.isBefore(end));
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)],
//       ),
//       child: SfDateRangePicker(
//         selectionMode: DateRangePickerSelectionMode.single,
//         initialSelectedDate: DateTime.now(),
//         minDate: DateTime(2020),
//         maxDate: DateTime(2030),
//         showNavigationArrow: true,
//         onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
//           setState(() {
//             _selectedDate = args.value;
//           });
//         },
//         cellBuilder: (context, details) {
//           final isBooked = _isBooked(details.date);
//           final isSelected = _selectedDate != null &&
//               details.date.year == _selectedDate!.year &&
//               details.date.month == _selectedDate!.month &&
//               details.date.day == _selectedDate!.day;
//           final isToday = DateTime.now().difference(details.date).inDays == 0 &&
//               DateTime.now().day == details.date.day;

//           return Container(
//             margin: const EdgeInsets.all(4),
//             decoration: BoxDecoration(
//               color: isSelected
//                   ? Colors.teal
//                   : isToday
//                       ? Colors.blue.shade100
//                       : isBooked
//                           ? Color(0xffb8e8e1)
//                           : Colors.transparent,
//               shape: BoxShape.circle,
//             ),
//             alignment: Alignment.center,
//             child: Text(
//               '${details.date.day}',
//               style: TextStyle(
//                 color: isSelected ? Colors.white : Colors.black,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// class Booking {
//   final DateTime startDate;
//   final DateTime? endDate;
//   Booking({required this.startDate, this.endDate});
// }
