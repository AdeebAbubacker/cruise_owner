part of 'see_my_booking_list_bloc.dart';

@freezed
class SeeMyBookingListEvent with _$SeeMyBookingListEvent {
   const factory SeeMyBookingListEvent.getBookingList() = _GetBookingList;
}