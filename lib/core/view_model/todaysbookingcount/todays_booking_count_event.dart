part of 'todays_booking_count_bloc.dart';

@freezed
class TodaysBookingCountEvent with _$TodaysBookingCountEvent {
  const factory TodaysBookingCountEvent.started() = _Started;
  const factory TodaysBookingCountEvent.getTodayscount() = _GetTodayscount;
}
