import 'package:cruise_buddy/core/view_model/createBookingByOwner/create_booking_by_owner_bloc.dart';
import 'package:cruise_buddy/core/view_model/listOwnerpackages/listowner_packages_bloc.dart';
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
            BlocBuilder<CreateBookingByOwnerBloc, CreateBookingByOwnerState>(
              builder: (context, state) {
                return state.map(
                  initial: (value) {
                    return Text("0");
                  },
                  loading: (value) {
                    return Text("0");
                  },
                  getCruiseTypes: (value) {
                    return Text("${value.cruisetypemodel.toString()}");
                  },
                  getCruiseTypesFailure: (value) {
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
                BlocProvider.of<CreateBookingByOwnerBloc>(context).add(
                  CreateBookingByOwnerEvent.getCruiseTypes(
                    packageId: '53',
                    bookingTypeId: '1',
                    startDate: '2027-09-07',
                  ),
                );
              },
              child: Text("data"),
            ),
          ],
        ),
      ),
    );
  }
}
