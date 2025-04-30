part of 'todays_booking_count_bloc.dart';

@freezed
class TodaysBookingCountState with _$TodaysBookingCountState {
  const factory TodaysBookingCountState.initial() = _Initial;
  const factory TodaysBookingCountState.loading() = _Loading;
  const factory TodaysBookingCountState.todaysCount(
      {required dynamic todaysCount}) = _TodaysCount;

  const factory TodaysBookingCountState.todayscountFailure(
      {required String error}) = TodayscountFailure;
  const factory TodaysBookingCountState.noInternet() = _NoInternet;
}
