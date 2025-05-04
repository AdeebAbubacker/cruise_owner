import 'package:cruise_buddy/core/constants/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NoDataScreen extends StatelessWidget {
  final String text;
  const NoDataScreen({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
            bottom: 140,
            child: SizedBox(
              width: double.infinity,
              child: SvgPicture.asset(
                'assets/icons/cruise_background.svg',
                colorFilter: const ColorFilter.mode(
                  Color.fromARGB(255, 194, 244, 242),
                  BlendMode.srcIn,
                ),
                fit: BoxFit.fill, // or BoxFit.cover
              ),
            ),
          ),
          Positioned(
            bottom: -50,
            child: SizedBox(
              width: double.infinity,
              child: SvgPicture.asset(
                'assets/icons/cruise_background.svg',
                colorFilter: const ColorFilter.mode(
                  Color.fromARGB(255, 194, 244, 242),
                  BlendMode.srcIn,
                ),
                fit: BoxFit.fill, // or BoxFit.cover
              ),
            ),
          ),
          Positioned(
            bottom: 130,
            child: SizedBox(
              width: double.infinity,
              child: SvgPicture.asset(
                'assets/icons/cruise_background.svg',
                colorFilter: const ColorFilter.mode(
                  Color.fromARGB(255, 194, 244, 242),
                  BlendMode.srcIn,
                ),
                fit: BoxFit.fill, // or BoxFit.cover
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/icons/not_available_404.svg'),
                  SizedBox(height: 20), // Adds spacing between elements
                  Text(
                    "No Cruise Available",
                    style: TextStyles.ubuntu18bluew700,
                  ),
                  SizedBox(height: 10),
                  Text(
                    text,
                    textAlign: TextAlign.center,
                    style: TextStyles.ubuntu14black55w400,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
