part of 'create_booking_by_owner_bloc.dart';

@freezed
class CreateBookingByOwnerState with _$CreateBookingByOwnerState {
  const factory CreateBookingByOwnerState.initial() = _Initial;
  const factory CreateBookingByOwnerState.loading() = _Loading;
  const factory CreateBookingByOwnerState.getCruiseTypes(
      {required String cruisetypemodel}) = _CreateOwnerBooking;
  const factory CreateBookingByOwnerState.ownerBookingValiationFailure(
      {required AddBookingValidation loginValidation}) = _OwnerBookingValiationFailure;

  const factory CreateBookingByOwnerState.getCruiseTypesFailure(
      {required String error}) = _CreateOwnerFailure;
  const factory CreateBookingByOwnerState.noInternet() = _NoInternet;
}
