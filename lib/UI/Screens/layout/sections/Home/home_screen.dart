import 'package:cruise_buddy/UI/Screens/layout/main_layout/main_layout.dart';
import 'package:cruise_buddy/UI/Screens/layout/sections/Home/widgets/categories_section.dart';
import 'package:cruise_buddy/UI/Screens/layout/sections/Home/widgets/explore_destination.dart';
import 'package:cruise_buddy/UI/Screens/layout/sections/Home/widgets/location_search_delgate.dart';
import 'package:cruise_buddy/UI/Screens/layout/sections/boats/widgets/featured_boats_container.dart';
import 'package:cruise_buddy/core/constants/styles/text_styles.dart';
import 'package:cruise_buddy/core/view_model/getUserProfile/get_user_profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:google_fonts/google_fonts.dart';

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

    return SafeArea(
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
                                    BlocBuilder<GetUserProfileBloc,
                                        GetUserProfileState>(
                                      builder: (context, state) {
                                        return state.map(
                                          initial: (value) {
                                            return SizedBox.shrink();
                                          },
                                          loading: (value) {
                                            return Shimmer.fromColors(
                                              baseColor: Colors.grey[300]!,
                                              highlightColor: Colors.grey[100]!,
                                              child: Text(
                                                "Loading...",
                                                style: TextStyles
                                                    .ubuntu32blue86w700,
                                              ),
                                            );
                                          },
                                          getuseruccess: (value) {
                                            return Text(
                                              truncateString(
                                                  value.userprofilemodel.data
                                                      ?.name,
                                                  11),
                                              style:
                                                  TextStyles.ubuntu32blue86w700,
                                            );
                                          },
                                          getuserFailure: (value) {
                                            return Text(
                                              "User",
                                              style:
                                                  TextStyles.ubuntu32blue86w700,
                                            );
                                          },
                                          noInternet: (value) {
                                            return SizedBox.shrink();
                                          },
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
                          children: const [
                            Text("Upcoming Bookings",
                                style: TextStyle(color: Colors.white)),
                            SizedBox(height: 8),
                            Text("21",
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
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
                          children: const [
                            Text("Past Bookings",
                                style: TextStyle(color: Colors.white)),
                            SizedBox(height: 8),
                            Text("15",
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
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
            // Padding(
            //   padding: const EdgeInsets.only(
            //     left: 30,
            //     right: 10,
            //   ),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Text(
            //         "Booking History",
            //         style: TextStyles.ubuntu20black15w700,
            //       ),
            //       Text("Today"),
            //       Row(
            //         children: [
            //           Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               SvgPicture.asset(
            //                 "assets/CircledArrow.svg",
            //                 width: 40,
            //               ),
            //               Text("23:22"),
            //             ],
            //           ),
            //           SizedBox(width: 10),
            //           Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               Text("Rohan Jacob"),
            //               Text("Transaction ID: 193762781"),
            //               SizedBox(height: 20)
            //             ],
            //           ),
            //           Spacer(),
            //           Text("Booked"),
            //         ],
            //       ),
            //       Text("27, Wednesday, 2024"),
            //       // ListView.builder(
            //       //   shrinkWrap: true,
            //       //   physics: NeverScrollableScrollPhysics(),
            //       //   itemCount: 10,
            //       //   itemBuilder: (context, index) {
            //       //     return Row(
            //       //       children: [
            //       //         Column(
            //       //           crossAxisAlignment: CrossAxisAlignment.start,
            //       //           children: [
            //       //             SvgPicture.asset(
            //       //               "assets/CircledArrow.svg",
            //       //               width: 40,
            //       //             ),
            //       //             Text("23:22"),
            //       //           ],
            //       //         ),
            //       //         SizedBox(width: 10),
            //       //         Column(
            //       //           crossAxisAlignment: CrossAxisAlignment.start,
            //       //           children: [
            //       //             Text("Rohan Jacob"),
            //       //             Text("Transaction ID: 193762781"),
            //       //             SizedBox(height: 20)
            //       //           ],
            //       //         ),
            //       //         Spacer(),
            //       //         Text("Booked"),
            //       //       ],
            //       //     );
            //       //   },
            //       // )

            //     TransactionList(),

            //     ],
            //   ),
            // ),

            BookingHistoryScreen(),
            SizedBox(height: 60),
          ],
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
          Text(
            "Today",
            style:
                GoogleFonts.ubuntu(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          ...transactionsToday.map((txn) => TransactionTile(txn)),
          SizedBox(height: 20),
          Text(
            "27, Wednesday, 2024",
            style:
                GoogleFonts.ubuntu(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: transactionsPrevious.length,
            itemBuilder: (context, index) {
              return TransactionTile(transactionsPrevious[index]);
            },
          ),
        ],
      ),
    );
  }
}

class TransactionTile extends StatelessWidget {
  final Map<String, String> txn;

  TransactionTile(this.txn);

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
              Text(
                txn["time"] ?? '',
                style: GoogleFonts.ubuntu(),
              ),
            ],
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                txn["name"] ?? '',
                style: GoogleFonts.ubuntu(fontWeight: FontWeight.bold),
              ),
              Text(
                "Transaction ID: ${txn["id"]}",
                style: GoogleFonts.ubuntu(),
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