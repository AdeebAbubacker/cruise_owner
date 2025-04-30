part of 'upcomg_bookingscount_bloc.dart';

@freezed
class UpcomgBookingscountState with _$UpcomgBookingscountState {
  const factory UpcomgBookingscountState.initial() = _Initial;
  const factory UpcomgBookingscountState.loading() = _Loading;
  const factory UpcomgBookingscountState.upcmingCount(
      {required dynamic upcomingCount}) = _UpcomingCount;

  const factory UpcomgBookingscountState.upcomingcountFailure(
      {required String error}) = TodayscountFailure;
  const factory UpcomgBookingscountState.noInternet() = _NoInternet;
}
