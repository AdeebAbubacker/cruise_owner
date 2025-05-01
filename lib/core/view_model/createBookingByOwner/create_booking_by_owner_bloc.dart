import 'package:bloc/bloc.dart';
import 'package:cruise_buddy/core/model/validation/add_booking_validation/add_booking_validation.dart';
import 'package:cruise_buddy/core/services/ownerBooking/owner_booking_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_booking_by_owner_event.dart';
part 'create_booking_by_owner_state.dart';
part 'create_booking_by_owner_bloc.freezed.dart';

class CreateBookingByOwnerBloc
    extends Bloc<CreateBookingByOwnerEvent, CreateBookingByOwnerState> {
  CreateBookingByOwnerBloc() : super(_Initial()) {
    OwnerBookingService ownerBookingService = OwnerBookingService();
    on<_CreateBookingByOwnerEvents>((event, emit) async {
      emit(const CreateBookingByOwnerState.loading());

      try {
        final result = await ownerBookingService.addItemToFavourites(
          bookingTypeId: event.bookingTypeId,
          endDate: event.endDate,
          packageId: event.packageId,
          startDate: event.startDate,
        );

        await result.fold((failure) async {
          if (failure == "No internet") {
            emit(const CreateBookingByOwnerState.noInternet());
          } else if (failure is AddBookingValidation) {
            print("login validation ${failure.message}");
            emit(CreateBookingByOwnerState.ownerBookingValiationFailure(
                loginValidation: failure));
          } else {
            emit(CreateBookingByOwnerState.getCruiseTypesFailure(
                error: failure));
          }
        }, (success) async {
          emit(
            CreateBookingByOwnerState.getCruiseTypes(
              cruisetypemodel: success,
            ),
          );
        });
      } catch (e) {
        emit(CreateBookingByOwnerState.getCruiseTypesFailure(
            error: 'An error occurred: $e'));
      }
    });
  }
}
