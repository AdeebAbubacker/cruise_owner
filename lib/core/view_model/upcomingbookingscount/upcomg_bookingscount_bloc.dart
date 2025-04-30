import 'package:bloc/bloc.dart';
import 'package:cruise_buddy/core/services/bookingCount/booking_count_servcie.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'upcomg_bookingscount_event.dart';
part 'upcomg_bookingscount_state.dart';
part 'upcomg_bookingscount_bloc.freezed.dart';

class UpcomgBookingscountBloc
    extends Bloc<UpcomgBookingscountEvent, UpcomgBookingscountState> {
  UpcomgBookingscountBloc() : super(_Initial()) {
    BookingCountServcie bookingCountServcie = BookingCountServcie();
    on<_GetUpcomingcount>((event, emit) async {
      emit(const UpcomgBookingscountState.loading());

      try {
        final result = await bookingCountServcie.getUpcomingCruiseCount();

        await result.fold((failure) async {
          if (failure == "No internet") {
            emit(const UpcomgBookingscountState.noInternet());
          } else {
            emit(UpcomgBookingscountState.upcomingcountFailure(error: failure));
          }
        }, (success) async {
          emit(UpcomgBookingscountState.upcmingCount(upcomingCount: success));
        });
      } catch (e) {
        emit(UpcomgBookingscountState.upcomingcountFailure(
            error: 'An error occurred: $e'));
      }
    });
  }
}
