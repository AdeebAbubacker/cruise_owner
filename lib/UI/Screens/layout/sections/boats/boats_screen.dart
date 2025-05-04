import 'package:cruise_buddy/UI/Screens/misc/see_mypackages_screen.dart';
import 'package:cruise_buddy/core/constants/styles/text_styles.dart';
import 'package:cruise_buddy/core/model/list_my_cruise_model/cruise.dart';
import 'package:cruise_buddy/core/view_model/listOwnerpackages/listowner_packages_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class BoatsScreen extends StatefulWidget {
  const BoatsScreen({super.key});

  @override
  State<BoatsScreen> createState() => _BoatsScreenState();
}

class _BoatsScreenState extends State<BoatsScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      BlocProvider.of<ListownerPackagesBloc>(context)
          .add(ListownerPackagesEvent.listPackages());
    });
    super.initState();
  }

  void _initScales(int length) {
    _scales = List.generate(length, (_) => 1.0);
  }

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
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListownerPackagesBloc, ListownerPackagesState>(
      builder: (context, state) {
        return state.map(
          initial: (value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          },
          loading: (value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          },
          listpackages: (value) {
            final cruises = value.listCruise[0].owner?.cruises ?? [];
            if (_scales.length != cruises.length) {
              _initScales(cruises.length);
            }
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: value.listCruise[0].owner?.cruises?.length,
              itemBuilder: (context, index) {
                final cruise = value.listCruise[0].owner?.cruises;
                return StatefulBuilder(builder: (context, setInnerState) {
                  return GestureDetector(
                    onTapDown: (_) {
                      setInnerState(() => _scales[index] = 0.97);
                    },
                    onTapCancel: () {
                      setInnerState(() => _scales[index] = 1.0);
                    },
                    onTapUp: (_) {
                      setInnerState(() => _scales[index] = 1.0);
                      Future.delayed(const Duration(milliseconds: 100), () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => SeeMyPackagesScreen(
                                cruise: cruise?[index] as Cruise),
                          ),
                        );
                      });
                    },
                    child: AnimatedScale(
                      duration: const Duration(milliseconds: 120),
                      scale: _scales[index],
                      curve: Curves.easeOut,
                      child: Card(
                        color: const Color.fromARGB(255, 252, 252, 252),
                        // elevation: 3,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            children: [
                              // Image
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  cruise?[index].cruisesImages?[0].cruiseImg ??
                                      '',
                                  height: 80,
                                  width: 80,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) =>
                                      Container(
                                    height: 80,
                                    width: 80,
                                    color: Colors.grey[300],
                                    child: const Icon(Icons.image,
                                        size: 40, color: Colors.grey),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              // Text info
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      cruise?[index].name ?? '',
                                      // style: const TextStyle(
                                      //     fontSize: 16, fontWeight: FontWeight.bold),
                                      style: GoogleFonts.ubuntu(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    // Text("Price: ₹${cruise.name ?? 'N/A'}"),
                                    // Text("Capacity: ${cruise.name ?? 'N/A'}"),
                                    // Text("Rooms: ${cruise.name ?? 'N/A'}"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                });
              },
            );
          },
          listpackagesFailure: (value) {
            return SizedBox(
              width: double.infinity,
              child: Stack(
                children: [
                  Positioned(
                    bottom: -40,
                    child: SizedBox(
                      width: double.infinity,
                      child: SvgPicture.asset(
                        'assets/icons/cruise_background.svg',
                        color: const Color.fromARGB(255, 196, 238, 237),
                        fit: BoxFit.fill, // or BoxFit.cover
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 140,
                    child: SvgPicture.asset(
                      'assets/icons/cruise_background.svg',
                      color: const Color.fromARGB(255, 181, 235, 233),
                      fit: BoxFit.fill, // or BoxFit.cover
                    ),
                  ),
                  Positioned(
                    bottom: 150,
                    child: SvgPicture.asset(
                      'assets/icons/cruise_background.svg',
                      color: const Color.fromARGB(255, 181, 235, 233),
                      fit: BoxFit.fill, // or BoxFit.cover
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                              'assets/icons/not_available_404.svg'),
                          Text(
                            "No Booking Yet",
                            style: TextStyles.ubuntu18bluew700,
                          ),
                          Center(
                            child: Text(
                              "It looks like no bookings yet.",
                              textAlign: TextAlign.center,
                              style: TextStyles.ubuntu14black55w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
          noInternet: (value) {
            return SizedBox(
              width: double.infinity,
              child: Stack(
                children: [
                  Positioned(
                    bottom: -40,
                    child: SizedBox(
                      width: double.infinity,
                      child: SvgPicture.asset(
                        'assets/icons/cruise_background.svg',
                        color: const Color.fromARGB(255, 196, 238, 237),
                        fit: BoxFit.fill, // or BoxFit.cover
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 140,
                    child: SizedBox(
                      width: double.infinity,
                      child: SvgPicture.asset(
                        'assets/icons/cruise_background.svg',
                        color: const Color.fromARGB(255, 181, 235, 233),
                        fit: BoxFit.fill, // or BoxFit.cover
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 150,
                    child: SizedBox(
                      width: double.infinity,
                      child: SvgPicture.asset(
                        'assets/icons/cruise_background.svg',
                        color: const Color.fromARGB(255, 181, 235, 233),
                        fit: BoxFit.fill, // or BoxFit.cover
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                              'assets/icons/not_available_404.svg'),
                          Text(
                            "No Booking Yet",
                            style: TextStyles.ubuntu18bluew700,
                          ),
                          Center(
                            child: Text(
                              "It looks like no bookings yet.",
                              textAlign: TextAlign.center,
                              style: TextStyles.ubuntu14black55w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
