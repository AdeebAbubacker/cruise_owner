part of 'create_booking_by_owner_bloc.dart';

@freezed
class CreateBookingByOwnerEvent with _$CreateBookingByOwnerEvent {
  const factory CreateBookingByOwnerEvent.started() = _Started;
   const factory CreateBookingByOwnerEvent.getCruiseTypes({
    required String packageId,
    required String bookingTypeId,
    required String startDate,
    String? endDate,
  }) = _CreateBookingByOwnerEvents;
}