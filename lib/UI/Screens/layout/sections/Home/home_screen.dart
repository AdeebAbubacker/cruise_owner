import 'package:cruise_buddy/UI/Screens/layout/main_layout/main_layout.dart';
import 'package:cruise_buddy/UI/Screens/layout/sections/Home/widgets/categories_section.dart';
import 'package:cruise_buddy/UI/Screens/layout/sections/Home/widgets/explore_destination.dart';
import 'package:cruise_buddy/UI/Screens/layout/sections/Home/widgets/location_search_delgate.dart';
import 'package:cruise_buddy/UI/Screens/layout/sections/boats/widgets/featured_boats_container.dart';
import 'package:cruise_buddy/core/constants/styles/text_styles.dart';
import 'package:cruise_buddy/core/db/hive_db/adapters/package_details_adapter/package_details_adapter.dart';
import 'package:cruise_buddy/core/db/hive_db/adapters/user_details_adapter/user_details_adapter.dart';
import 'package:cruise_buddy/core/db/hive_db/boxes/package_details_box.dart';
import 'package:cruise_buddy/core/db/hive_db/boxes/user_details_box.dart';
import 'package:cruise_buddy/core/model/list_my_cruise_model/package.dart';
import 'package:cruise_buddy/core/view_model/getUserProfile/get_user_profile_bloc.dart';
import 'package:cruise_buddy/core/view_model/listOwnerpackages/listowner_packages_bloc.dart';
import 'package:cruise_buddy/core/view_model/seeMyBookingList/see_my_booking_list_bloc.dart';
import 'package:cruise_buddy/core/view_model/todaysbookingcount/todays_booking_count_bloc.dart';
import 'package:cruise_buddy/core/view_model/upcomingbookingscount/upcomg_bookingscount_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
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
      BlocProvider.of<GetUserProfileBloc>(context)
          .add(GetUserProfileEvent.getUserProfile());
      BlocProvider.of<SeeMyBookingListBloc>(context)
          .add(SeeMyBookingListEvent.getBookingList());
      BlocProvider.of<TodaysBookingCountBloc>(context)
          .add(TodaysBookingCountEvent.getTodayscount());
      BlocProvider.of<UpcomgBookingscountBloc>(context)
          .add(UpcomgBookingscountEvent.getUpcomingcount());
      BlocProvider.of<ListownerPackagesBloc>(context)
          .add(ListownerPackagesEvent.listPackages());
    });
    super.initState();
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
        print("objecggt");
        state.mapOrNull(
          listpackages: (value) async {
            print("object");
             await packageDetailsBox.clear();

            final List<Cruise> cruises = value.listCruise?.firstOrNull?.owner?.cruises ?? [];

            for (Cruise cruise in cruises) {
              final image = (cruise.cruisesImages ?? []).isNotEmpty
                  ? cruise.cruisesImages!.first.cruiseImg
                  : null;
              final cruiseName = cruise.name;
              for (Package package in cruise.packages ?? []) {
                final packageDetails = PackageDetailsDB(
                  packageId: package.id.toString(),
                  cruiseImage: image, 
                  cruiseName: cruiseName,
                  packageName: package.name.toString(),
                  // optionally: cruiseId, packageName, etc.
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
                                    "Book your perfect boat adventure in just a few taps!",
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
                            color: Color(0XFF2DCCD1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Todays Bookings",
                                  style: TextStyle(color: Colors.white)),
                              SizedBox(height: 8),
                              BlocBuilder<TodaysBookingCountBloc,
                                  TodaysBookingCountState>(
                                builder: (context, state) {
                                  return state.map(
                                    initial: (value) {
                                      return Text(
                                        "21",
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
                                        style: TextStyle(
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
                            color: Color(0XFF2DCCD1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Upcoming Bookings",
                                  style: TextStyle(color: Colors.white)),
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
                                        style: TextStyle(
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Booking History",
            style:
                GoogleFonts.ubuntu(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 10),
          BlocBuilder<SeeMyBookingListBloc, SeeMyBookingListState>(
            builder: (context, state) {
              return state.map(
                initial: (value) {
                  return Column(
                    children: [
                      SizedBox(height: 40),
                      Center(child: CircularProgressIndicator()),
                    ],
                  );
                },
                loading: (value) {
                  return CircularProgressIndicator();
                },
                getuseruccess: (value) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: value.userprofilemodel.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      print(
                          "name '${value.userprofilemodel.data?[index].user?.name}");
                      return TransactionTile(
                        name:
                            '${value.userprofilemodel.data?[index].user?.name}',
                        transactionId:
                            '${value.userprofilemodel.data?[index].invoiceId}',
                        time:
                            '${value.userprofilemodel.data?[index].startDate}',
                      );
                    },
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
        ],
      ),
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
              SvgPicture.asset(
                "assets/CircledArrow.svg",
                width: 40,
              ),
              SizedBox(
                width: 85,
                child: Text(
                  formatDateWithSuffix(time),
                  style: GoogleFonts.ubuntu(fontSize: 12),
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
                name ?? '',
                style: GoogleFonts.ubuntu(fontWeight: FontWeight.bold),
              ),
              Text(
                "Transaction ID: $transactionId",
                style: GoogleFonts.ubuntu(
                  fontSize: 12,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 20),
            ],
          ),
          Spacer(),
          Text(
            "Booked",
            style: GoogleFonts.ubuntu(color: Colors.green),
          ),
        ],
      ),
    );
  }
}

//Cruise@2025
