import 'package:bloc/bloc.dart';
import 'package:cruise_buddy/core/model/get_my_booking_list/get_my_booking_list.dart';
import 'package:cruise_buddy/core/services/seeMyBookingList/seeMyBookingListService.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'see_my_booking_list_event.dart';
part 'see_my_booking_list_state.dart';
part 'see_my_booking_list_bloc.freezed.dart';

class SeeMyBookingListBloc
    extends Bloc<SeeMyBookingListEvent, SeeMyBookingListState> {
  SeeMyBookingListBloc() : super(_Initial()) {
    Seemybookinglistservice seemybookinglistservice = Seemybookinglistservice();

    on<_GetBookingList>((event, emit) async {
      emit(const SeeMyBookingListState.loading());

      try {
        final result = await seemybookinglistservice.seeMyBooking();

        await result.fold((failure) async {
          if (failure == "No internet") {
            emit(const SeeMyBookingListState.noInternet());
          } else {
            emit(SeeMyBookingListState.getuserFailure(error: failure));
          }
        }, (success) async {
          emit(SeeMyBookingListState.getuseruccess(userprofilemodel: success));
        });
      } catch (e) {
        emit(SeeMyBookingListState.getuserFailure(
            error: 'An error occurred: $e'));
      }
    });
  }
}
