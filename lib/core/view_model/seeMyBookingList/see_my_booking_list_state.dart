part of 'see_my_booking_list_bloc.dart';

@freezed
class SeeMyBookingListState with _$SeeMyBookingListState {
  const factory SeeMyBookingListState.initial() = _Initial;
  const factory SeeMyBookingListState.loading() = _Loading;
  const factory SeeMyBookingListState.getuseruccess(
      {required GetMyBookingList userprofilemodel}) = _GetMyBookingList;

  const factory SeeMyBookingListState.getuserFailure({required String error}) =
      GetuserFailure;
  const factory SeeMyBookingListState.noInternet() = _NoInternet;
}
