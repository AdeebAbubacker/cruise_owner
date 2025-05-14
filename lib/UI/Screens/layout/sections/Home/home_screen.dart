import 'package:cruise_buddy/UI/Screens/layout/main_layout/main_layout.dart';
import 'package:cruise_buddy/UI/Screens/layout/sections/Home/widgets/categories_section.dart';
import 'package:cruise_buddy/UI/Screens/layout/sections/Home/widgets/explore_destination.dart';
import 'package:cruise_buddy/UI/Screens/layout/sections/Home/widgets/location_search_delgate.dart';
import 'package:cruise_buddy/UI/Screens/layout/sections/boats/widgets/featured_boats_container.dart';
import 'package:cruise_buddy/UI/Widgets/OrderDetailsPopup/order_details_popup.dart';
import 'package:cruise_buddy/UI/Widgets/shimmer/transaction_tile_shimmer.dart';
import 'package:cruise_buddy/UI/Widgets/toast/custom_toast.dart';
import 'package:cruise_buddy/core/constants/styles/text_styles.dart';
import 'package:cruise_buddy/core/db/hive_db/adapters/package_details_adapter/package_details_adapter.dart';
import 'package:cruise_buddy/core/db/hive_db/adapters/user_details_adapter/user_details_adapter.dart';
import 'package:cruise_buddy/core/db/hive_db/boxes/package_details_box.dart';
import 'package:cruise_buddy/core/db/hive_db/boxes/user_details_box.dart';
import 'package:cruise_buddy/core/model/get_my_booking_list/get_my_booking_list.dart';
import 'package:cruise_buddy/core/model/list_my_cruise_model/package.dart';
import 'package:cruise_buddy/core/view_model/listOwnerpackages/listowner_packages_bloc.dart';
import 'package:cruise_buddy/core/view_model/seeMyBookingList/see_my_booking_list_bloc.dart';
import 'package:cruise_buddy/core/view_model/todaysbookingcount/todays_booking_count_bloc.dart';
import 'package:cruise_buddy/core/view_model/upcomingbookingscount/upcomg_bookingscount_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/model/list_my_cruise_model/cruise.dart';

class HomeScreen extends StatefulWidget {
  final VoidCallback changetab;
  const HomeScreen({
    super.key,
    required this.changetab,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final seeMybookingListBloc =
          BlocProvider.of<SeeMyBookingListBloc>(context);
      final todaysCountBloc = BlocProvider.of<TodaysBookingCountBloc>(context);
      final upcomingCountBloc =
          BlocProvider.of<UpcomgBookingscountBloc>(context);

      final listOwnerPackagesBloc =
          BlocProvider.of<ListownerPackagesBloc>(context);

      //2//--------------------

      final isbookingListalreadyLoaded = seeMybookingListBloc.state.maybeWhen(
        getuseruccess: (_) => true,
        orElse: () => false,
      );

      if (!isbookingListalreadyLoaded) {
        seeMybookingListBloc.add(SeeMyBookingListEvent.getBookingList());
      }
      //3//--------------------
      final istodaysCountLoaded = todaysCountBloc.state.maybeWhen(
        todaysCount: (_) => true,
        orElse: () => false,
      );

      if (!istodaysCountLoaded) {
        todaysCountBloc.add(TodaysBookingCountEvent.getTodayscount());
      }
      //4//--------------------
      final isupcomingCountLoaded = upcomingCountBloc.state.maybeWhen(
        upcmingCount: (_) => true,
        orElse: () => false,
      );

      if (!isupcomingCountLoaded) {
        upcomingCountBloc.add(UpcomgBookingscountEvent.getUpcomingcount());
      }
      //5//--------------------
      final islistOwnerPackagesoaded = listOwnerPackagesBloc.state.maybeWhen(
        listpackages: (_) => true,
        orElse: () => false,
      );

      if (!islistOwnerPackagesoaded) {
        listOwnerPackagesBloc.add(ListownerPackagesEvent.listPackages());
      }

      checkForUpdate();
    });
    super.initState();
  }

  Future<void> checkForUpdate() async {
    try {
      final updateInfo = await InAppUpdate.checkForUpdate();

      if (updateInfo.updateAvailability == UpdateAvailability.updateAvailable) {
        InAppUpdate.performImmediateUpdate().catchError((e) {});
      }
    } catch (e) {}
  }

  String splitIntoTwoLines(String text) {
    List<String> words = text.split(' ');
    if (words.length == 1) {
      // Split a single word in half
      int middle = (words[0].length / 2).ceil();
      return words[0].substring(0, middle) + '\n' + words[0].substring(middle);
    } else {
      // Distribute words to balance line length
      int half = (words.length / 2).ceil();
      String line1 = words.sublist(0, half).join(' ');
      String line2 = words.sublist(half).join(' ');
      return line1 + '\n' + line2;
    }
  }

  @override
  Widget build(BuildContext context) {
    String truncateString(String? value, int maxLength) {
      if (value == null) {
        return '';
      }
      return value.length > maxLength ? value.substring(0, maxLength) : value;
    }

    return BlocListener<ListownerPackagesBloc, ListownerPackagesState>(
      listener: (context, state) {
        state.mapOrNull(
          listpackages: (value) async {
            await packageDetailsBox.clear();

            final List<Cruise> cruises =
                value.listCruise?.firstOrNull?.owner?.cruises ?? [];

            for (Cruise cruise in cruises) {
              final image = (cruise.cruisesImages ?? []).isNotEmpty
                  ? cruise.cruisesImages!.first.cruiseImg
                  : null;
              final cruiseName = cruise.name;

              for (Package package in cruise.packages ?? []) {
                final List<String> bookingTypeIds = (package.bookingTypes ?? [])
                    .map((bt) => bt.id.toString())
                    .toList();

                final packageDetails = PackageDetailsDB(
                  packageId: package.id.toString(),
                  bookingTypeIds: bookingTypeIds,
                  cruiseImage: image,
                  cruiseName: cruiseName,
                  packageName: package.id.toString(),
                );

                await packageDetailsBox.add(packageDetails);
              }
            }
          },
        );
      },
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 230,
                child: Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 200,
                      child: Stack(
                        children: [
                          SvgPicture.asset(
                            'assets/home/promotionalBanner.svg',
                            width: double.infinity,
                            fit: BoxFit.fill,
                          ),
                          Positioned(
                            left: 20,
                            top: 40,
                            child: SizedBox(
                              width: 220,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Hi",
                                        style: TextStyles.ubuntu32black15w700,
                                      ),
                                      SizedBox(width: 5),
                                      ValueListenableBuilder(
                                        valueListenable:
                                            userDetailsBox.listenable(),
                                        builder: (context, Box box, _) {
                                          final userDetails =
                                              box.get('user') as UserDetailsDB?;

                                          if (userDetails == null) {
                                            return Text(
                                              "User",
                                              style:
                                                  TextStyles.ubuntu32blue86w700,
                                            );
                                          }

                                          return Text(
                                            truncateString(
                                                userDetails.name?.toString(),
                                                11),
                                            style:
                                                TextStyles.ubuntu32blue86w700,
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "Effortlessly manage your boat bookings, track orders.",
                                    style: TextStyles.ubuntu14black55w400,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 30,
                ),
                child: Text(
                  "Overview",
                  style: TextStyles.ubuntu20black15w700,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    // Calculate half of available width with some spacing
                    double calculatedWidth = (constraints.maxWidth - 10) / 2;
                    double containerWidth =
                        calculatedWidth > 150 ? 150 : calculatedWidth;

                    return Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: containerWidth,
                          height: 120,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xFF2DCCD1),
                                Color(0xFF1F8386),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                splitIntoTwoLines("Todays Bookings"),
                                style: GoogleFonts.ubuntu(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                                maxLines: 2,
                              ),
                              SizedBox(height: 8),
                              BlocBuilder<TodaysBookingCountBloc,
                                  TodaysBookingCountState>(
                                builder: (context, state) {
                                  return state.map(
                                    initial: (value) {
                                      return Text(
                                        "0",
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      );
                                    },
                                    loading: (value) {
                                      return Text(
                                        "0",
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      );
                                    },
                                    noInternet: (value) {
                                      return Text(
                                        "0",
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      );
                                    },
                                    todaysCount: (value) {
                                      return Text(
                                        "${value.todaysCount ?? 0}",
                                        style: GoogleFonts.ubuntu(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      );
                                    },
                                    todayscountFailure: (value) {
                                      return Text(
                                        "0",
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                          width: containerWidth,
                          height: 120,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xFF434343),
                                Color(0xFF131515),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                splitIntoTwoLines("Upcoming Bookings"),
                                style: GoogleFonts.ubuntu(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                                maxLines: 2,
                              ),
                              SizedBox(height: 8),
                              BlocBuilder<UpcomgBookingscountBloc,
                                  UpcomgBookingscountState>(
                                builder: (context, state) {
                                  return state.map(
                                    initial: (value) {
                                      return Text(
                                        "0",
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      );
                                    },
                                    loading: (value) {
                                      return Text(
                                        "0",
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      );
                                    },
                                    upcmingCount: (value) {
                                      return Text(
                                        "${value.upcomingCount}",
                                        style: GoogleFonts.ubuntu(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      );
                                    },
                                    upcomingcountFailure: (value) {
                                      return Text(
                                        "0",
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      );
                                    },
                                    noInternet: (value) {
                                      return Text(
                                        "0",
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      );
                                    },
                                  );
                                  // Text("15",
                                  //     style: TextStyle(
                                  //         fontSize: 24,
                                  //         fontWeight: FontWeight.bold,
                                  //         color: Colors.white));
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              BookingHistoryScreen(),
              SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }

  void openLocationSearchDelegate(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return FadeTransition(
            opacity: animation,
            child: const LocationSearchDelegate(),
          );
        },
        transitionDuration: const Duration(milliseconds: 500),
        reverseTransitionDuration: const Duration(milliseconds: 300),
      ),
    );
  }
}

class BookingHistoryScreen extends StatelessWidget {
  final List<Map<String, String>> transactionsToday = [
    {
      "name": "Rohan Jacob",
      "time": "23:22",
      "id": "193762781",
    },
  ];

  final List<Map<String, String>> transactionsPrevious = [
    {
      "name": "Vishnu Dev",
      "time": "09:15",
      "id": "193762782",
    },
    {
      "name": "Jayakrishnan",
      "time": "10:45",
      "id": "193762783",
    },
    {
      "name": "Surya Narayan",
      "time": "12:30",
      "id": "193762784",
    },
    {
      "name": "Samuel Mathew",
      "time": "13:10",
      "id": "193762785",
    },
    {
      "name": "Nikhil Raj",
      "time": "14:40",
      "id": "193762786",
    },
    {
      "name": "Anand Kurian",
      "time": "15:25",
      "id": "193762787",
    },
    {
      "name": "Dinesh Paul",
      "time": "17:00",
      "id": "193762788",
    },
    {
      "name": "Rahul Varghese",
      "time": "18:45",
      "id": "193762789",
    },
    {
      "name": "Arun Thomas",
      "time": "20:20",
      "id": "193762790",
    },
  ];

  BookingHistoryScreen({super.key});
  List<double> _scales = [
    1.0,
    1.0,
    1.0,
    1.0,
    1.0,
    1.0,
    1.0,
    1.0,
    1.0,
    1.0,
    1.0,
    1.0,
    1.0,
    1.0,
    1.0,
    1.0,
    1.0,
    1.0,
    1.0,
    1.0,
    1.0,
    1.0,
    1.0,
    1.0,
    1.0,
    1.0,
    1.0,
    1.0,
    1.0,
    1.0,
    1.0,
    1.0,
    1.0,
    1.0,
    1.0,
    1.0,
    1.0,
    1.0,
    1.0,
    1.0,
    1.0,
    1.0,
    1.0,
    1.0,
    1.0,
    1.0,
    1.0,
    1.0,
    1.0,
    1.0,
    1.0,
    1.0
  ];

  void _initScales(int length) {
    _scales = List.generate(length, (_) => 1.0);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 10),
          child: Text(
            "Booking History",
            style:
                GoogleFonts.ubuntu(fontSize: 20, fontWeight: FontWeight.w700),
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 9,
          ),
          child: BlocBuilder<SeeMyBookingListBloc, SeeMyBookingListState>(
            builder: (context, state) {
              return state.map(
                initial: (value) {
                  return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (_, __) => const TransactionTileShimmer(),
                  );
                },
                loading: (value) {
                  return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (_, __) => const TransactionTileShimmer(),
                  );
                },
                getuseruccess: (value) {
                  if (_scales.length != value.userprofilemodel.data?.length) {
                    _initScales(value.userprofilemodel.data?.length ?? 0);
                  }
                  return Padding(
                    padding: const EdgeInsets.only(right: 4),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: value.userprofilemodel.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        print(
                            "name '${value.userprofilemodel.data?[index].user?.name}");
                        final transaction = value.userprofilemodel.data?[index];
                        final user = transaction?.user;
                        final GlobalKey qrKey = GlobalKey();
                        return StatefulBuilder(
                            builder: (context, setInnerState) {
                          return GestureDetector(
                            onTapDown: (_) {
                              setInnerState(() => _scales[index] = 0.97);
                            },
                            onTapCancel: () {
                              setInnerState(() => _scales[index] = 1.0);
                            },
                            onTapUp: (_) {
                              setInnerState(() => _scales[index] = 1.0);

                              if (user != null) {
                                showDialog(
                                  context: context,
                                  builder: (context) => BookingDetailsPopup(
                                    booking:
                                        value.userprofilemodel.data?[index] ??
                                            BookingData(),
                                    qrKey: qrKey,
                                  ),
                                );
                              } else {
                                CustomToast.showFlushBar(
                                    context: context,
                                    status: false,
                                    title: "Sorry",
                                    content: "No Details available");
                              }
                            },
                            child: AnimatedScale(
                              duration: const Duration(milliseconds: 120),
                              scale: _scales[index],
                              curve: Curves.easeOut,
                              child: TransactionTile(
                                name:
                                    '${value.userprofilemodel.data?[index].user?.name}',
                                transactionId:
                                    '${value.userprofilemodel.data?[index].invoiceId}',
                                time:
                                    '${value.userprofilemodel.data?[index].startDate}',
                              ),
                            ),
                          );
                        });
                      },
                    ),
                  );
                },
                getuserFailure: (value) {
                  return Column(
                    children: [
                      SizedBox(height: 40),
                      Center(child: Text("No Bookings Available")),
                    ],
                  );
                },
                noInternet: (value) {
                  return Text("No Internet");
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

class TransactionTile extends StatelessWidget {
  final String name;
  final String transactionId;
  final String time;

  const TransactionTile({
    super.key,
    required this.name,
    required this.transactionId,
    required this.time,
  });
  String formatDateWithSuffix(String dateStr) {
    final date = DateTime.parse(dateStr);

    // Get day with suffix
    String day = date.day.toString();
    String suffix;
    if (day.endsWith('1') && day != '11') {
      suffix = 'st';
    } else if (day.endsWith('2') && day != '12') {
      suffix = 'nd';
    } else if (day.endsWith('3') && day != '13') {
      suffix = 'rd';
    } else {
      suffix = 'th';
    }

    final month = DateFormat('MMMM').format(date); // "March"
    final year = date.year.toString(); // "2025"
    return "$day$suffix $month\n$year"; // "19th March\n2025"
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              BlinkingArrowIcon(name: name),
              SizedBox(
                width: 85,
                child: Text(
                  formatDateWithSuffix(time),
                  style: GoogleFonts.ubuntu(fontSize: 10),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                (name == null || name == 'null')
                    ? 'N/A'
                    : (name.trim().isEmpty ? 'N/A' : name),
                style: GoogleFonts.ubuntu(fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
                softWrap: false,
              ),
              Text(
                "Transaction ID: $transactionId",
                style: GoogleFonts.ubuntu(
                  fontSize: 12,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                softWrap: false,
              ),
              SizedBox(height: 20),
            ],
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              (name == null || name == 'null' || name.trim().isEmpty)
                  ? 'Pending'
                  : 'Booked',
              style: GoogleFonts.ubuntu(
                color: (name == null || name == 'null' || name.trim().isEmpty)
                    ? Colors.red
                    : Colors.green,
              ),
            ),
          )
        ],
      ),
    );
  }
}

//Cruise@2025
class BlinkingArrowIcon extends StatefulWidget {
  final String? name;

  const BlinkingArrowIcon({super.key, this.name});

  @override
  State<BlinkingArrowIcon> createState() => _BlinkingArrowIconState();
}

class _BlinkingArrowIconState extends State<BlinkingArrowIcon>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _opacityAnimation;

  bool get isBlue => widget.name != null && widget.name != 'null';

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _opacityAnimation =
        Tween<double>(begin: 1.0, end: 0.3).animate(_controller);

    if (isBlue) {
      _controller.repeat(reverse: true);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color =
        isBlue ? Colors.green : const Color.fromARGB(255, 144, 209, 239);

    final arrow = SvgPicture.asset(
      "assets/CircledArrow.svg",
      width: 40,
      color: color,
    );

    return isBlue
        ? FadeTransition(opacity: _opacityAnimation, child: arrow)
        : arrow;
  }
}
