import 'package:bloc/bloc.dart';
import 'package:cruise_buddy/core/services/bookingCount/booking_count_servcie.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todays_booking_count_event.dart';
part 'todays_booking_count_state.dart';
part 'todays_booking_count_bloc.freezed.dart';

class TodaysBookingCountBloc
    extends Bloc<TodaysBookingCountEvent, TodaysBookingCountState> {
  TodaysBookingCountBloc() : super(_Initial()) {
    BookingCountServcie bookingCountServcie = BookingCountServcie();
    on<_GetTodayscount>((event, emit) async {
      emit(const TodaysBookingCountState.loading());

      try {
        final result = await bookingCountServcie.getTodaysCruiseCount();

        await result.fold((failure) async {
          if (failure == "No internet") {
            emit(const TodaysBookingCountState.noInternet());
          } else {
            emit(TodaysBookingCountState.todayscountFailure(error: failure));
          }
        }, (success) async {
          emit(TodaysBookingCountState.todaysCount(todaysCount: success));
        });
      } catch (e) {
        emit(TodaysBookingCountState.todayscountFailure(
            error: 'An error occurred: $e'));
      }
    });
  }
}
