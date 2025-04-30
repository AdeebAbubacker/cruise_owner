part of 'upcomg_bookingscount_bloc.dart';

@freezed
class UpcomgBookingscountEvent with _$UpcomgBookingscountEvent {
  const factory UpcomgBookingscountEvent.started() = _Started;
  const factory UpcomgBookingscountEvent.getUpcomingcount() = _GetUpcomingcount;
}
