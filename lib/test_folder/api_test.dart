import 'package:cruise_buddy/core/services/bookingCount/booking_count_servcie.dart';
import 'package:cruise_buddy/core/services/ownerPacakage/owner_packages_service.dart';
import 'package:cruise_buddy/core/services/seeMyBookingList/seeMyBookingListService.dart';
import 'package:cruise_buddy/core/view_model/bookMyCruise/book_my_cruise_bloc.dart';
import 'package:cruise_buddy/core/view_model/seeMyBookingList/see_my_booking_list_bloc.dart';
import 'package:cruise_buddy/core/view_model/upcomingbookingscount/upcomg_bookingscount_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApiTest extends StatelessWidget {
  const ApiTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 100),
            BlocBuilder<UpcomgBookingscountBloc, UpcomgBookingscountState>(
              builder: (context, state) {
                return state.map(
                  initial: (value) {
                    return Text("0");
                  },
                  loading: (value) {
                    return Text("0");
                  },
                  upcmingCount: (value) {
                    return Text("${value.upcomingCount}");
                  },
                  upcomingcountFailure: (value) {
                    return Text("0");
                  },
                  noInternet: (value) {
                    return Text("0");
                  },
                );
              },
            ),
            ElevatedButton(
              onPressed: () async {
                await OwnerPackagesService().getOwnerspackages();
              },
              child: Text("data"),
            ),
          ],
        ),
      ),
    );
  }
}
