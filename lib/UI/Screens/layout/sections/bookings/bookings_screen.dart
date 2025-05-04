import 'package:cruise_buddy/UI/Screens/layout/sections/Home/widgets/booking_type_dropdwon.dart';
import 'package:cruise_buddy/UI/Screens/layout/sections/Home/widgets/pacakge_dropddown.dart';
import 'package:cruise_buddy/UI/Widgets/toast/custom_toast.dart';
import 'package:cruise_buddy/core/constants/styles/text_styles.dart';
import 'package:cruise_buddy/core/db/hive_db/adapters/package_details_adapter/package_details_adapter.dart';
import 'package:cruise_buddy/core/db/hive_db/boxes/package_details_box.dart';
import 'package:cruise_buddy/core/model/get_my_booking_list/get_my_booking_list.dart';
import 'package:cruise_buddy/core/view_model/createBookingByOwner/create_booking_by_owner_bloc.dart';
import 'package:cruise_buddy/core/view_model/seeMyBookingList/see_my_booking_list_bloc.dart';
import 'package:cruise_buddy/test_folder/api_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
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
            context
                .read<SeeMyBookingListBloc>()
                .add(SeeMyBookingListEvent.getBookingList());
            CustomToast.showFlushBar(
              context: context,
              status: true,
              title: "COngrats",
              content: "Your booking has been locked",
            );
          },
          getCruiseTypesFailure: (value) {
            CustomToast.showFlushBar(
              context: context,
              status: false,
              title: "Oops",
              content: "Something went wrong",
            );
          },
          ownerBookingValiationFailure: (value) {
            CustomToast.showFlushBar(
              context: context,
              status: false,
              title: "Sorry",
              content: "${value.loginValidation.message}",
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
            // PackageDetailsDB? selectedPackage;
            DateTime? selectedStart;
            DateTime? selectedEnd;
            //   String? selectedBookingTypeId;
            Box<PackageDetailsDB> packageDetailsBox =
                Hive.box<PackageDetailsDB>('packageDetailsBox');
            PackageBookingSelection? selectedPackage;
            String selectedBookingTypeId = '';
            showDialog(
              context: context,
              builder: (context) {
                return StatefulBuilder(
                  builder: (context, setState) {
                    return AlertDialog(
                      title: Text(
                        "New Booking",
                        style: GoogleFonts.ubuntu(),
                      ),
                      content: SingleChildScrollView(
                        child: Column(
                          children: [
                            Divider(),
                            ValueListenableBuilder<Box<PackageDetailsDB>>(
                              valueListenable: packageDetailsBox.listenable(),
                              builder: (context, box, _) {
                                final packages = box.values.toList();
                                final packageItems = <DropdownMenuItem<
                                    PackageBookingSelection>>[];

                                for (var pkg in packages) {
                                  for (var bookingType
                                      in pkg.bookingTypeIds ?? []) {
                                    final selection = PackageBookingSelection(
                                        pkg, bookingType.toString());
                                    packageItems.add(DropdownMenuItem<
                                        PackageBookingSelection>(
                                      value: selection,
                                      child: PackageDropdownItem(
                                        package: pkg,
                                        bookingTypeId: bookingType.toString(),
                                      ),
                                    ));
                                  }
                                }

                                return DropdownButtonHideUnderline(
                                  child:
                                      DropdownButton<PackageBookingSelection>(
                                    isExpanded: true,
                                    value: selectedPackage,
                                    hint: Text(
                                      "Select a Package",
                                      style: GoogleFonts.ubuntu(),
                                    ),
                                    items: packageItems,
                                    onChanged: (val) {
                                      setState(() {
                                        selectedPackage = val;
                                        selectedBookingTypeId =
                                            val?.bookingTypeId ?? '';
                                      });
                                    },
                                    dropdownColor: Colors.white,
                                    itemHeight: 70.0,
                                  ),
                                );
                              },
                            ),
                            //   ],
                            // ),
                            const SizedBox(height: 10),

                            // Start Date
                            OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                side: const BorderSide(
                                    color: Color(0xFF1F8386), width: 1.5),
                                foregroundColor: Color(0xFF1F8386),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 12),
                              ),
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
                            OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                side: const BorderSide(
                                    color: Color(0xFF1F8386), width: 1.5),
                                foregroundColor: Color(0xFF1F8386),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 12),
                              ),
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
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  5), // Set to 0 for sharp corners
                            ),
                            backgroundColor: const Color(
                                0xFF1F8386), // Optional: custom background
                            foregroundColor:
                                Colors.white, // Optional: custom text color
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 12),
                          ),
                          onPressed: () {
                            if (selectedStart == null ||
                                selectedPackage == null) return;
                            // Extracting packageId, startDate, and endDate.
                            String packageId = selectedPackage
                                    ?.package.bookingTypeIds?.first
                                    .toString() ??
                                '1'; // Assuming packageId is a field of PackageDetailsDB.
                            String startDate =
                                DateFormat('yyyy-MM-dd').format(selectedStart!);
                            String? endDate = selectedEnd != null
                                ? DateFormat('yyyy-MM-dd').format(selectedEnd!)
                                : null;

                            BlocProvider.of<CreateBookingByOwnerBloc>(context)
                                .add(
                              CreateBookingByOwnerEvent.getCruiseTypes(
                                packageId: packageId,
                                bookingTypeId: selectedBookingTypeId,
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
                                ownerBookingValiationFailure: (value) {
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
                        child: AddBookingIcon(
                          onTap: () {
                            showBookingDialog(context); // Your dialog function
                          },
                        )),
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
                        bool isCancelled = b.bookedByUser == false;
                        final startDate = DateFormat('MMM d, yyyy').format(
                            DateTime.parse(b.startDate.toString() ?? ''));
                        final endDate = DateFormat('MMM d, yyyy')
                            .format(DateTime.parse(b.endDate.toString() ?? ''));
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
                            isCancelled ? 'Cruise Not Available' : 'Booked',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: isCancelled ? Colors.red : Colors.teal,
                            ),
                          ),
                          subtitle: Text(
                            isCancelled
                                ? 'You already have a trip on ${DateFormat('MMM d, yyyy').format(DateTime.parse(b.startDate.toString() ?? ''))}'
                                : (startDate == endDate
                                    ? 'Your houseboat is booked for $startDate'
                                    : 'Your houseboat is booked from $startDate to $endDate'),
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

class AddBookingIcon extends StatefulWidget {
  final VoidCallback onTap; // This is the callback function

  const AddBookingIcon({super.key, required this.onTap});

  @override
  State<AddBookingIcon> createState() => _AddBookingIconState();
}

class _AddBookingIconState extends State<AddBookingIcon>
    with SingleTickerProviderStateMixin {
  bool isRotated = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: GestureDetector(
        onTap: () {
          setState(() {
            isRotated = !isRotated;
          });
          widget.onTap(); // Call the passed function when tapped
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedRotation(
              turns: isRotated ? 0.25 : 0.0,
              duration: const Duration(milliseconds: 300),
              child: const Icon(
                Icons.add_circle,
                size: 40,
                color: Color.fromARGB(255, 70, 105, 150),
              ),
            ),
            const SizedBox(width: 8),
            const Text(
              "Add Booking",
              style: TextStyle(
                color: Color.fromARGB(255, 70, 105, 150),
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
