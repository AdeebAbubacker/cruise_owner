import 'package:bloc/bloc.dart';
import 'package:cruise_buddy/core/model/list_my_cruise_model/list_my_cruise_model.dart';
import 'package:cruise_buddy/core/services/ownerPacakage/owner_packages_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'listowner_packages_event.dart';
part 'listowner_packages_state.dart';
part 'listowner_packages_bloc.freezed.dart';

class ListownerPackagesBloc
    extends Bloc<ListownerPackagesEvent, ListownerPackagesState> {
  ListownerPackagesBloc() : super(_Initial()) {
    OwnerPackagesService ownerPackagesService = OwnerPackagesService();
    on<_ListPackages>((event, emit) async {
      emit(const ListownerPackagesState.loading());

      try {
        final result = await ownerPackagesService.getOwnerspackages();

        await result.fold((failure) async {
          if (failure == "No internet") {
            emit(const ListownerPackagesState.noInternet());
          } else {
            emit(ListownerPackagesState.listpackagesFailure(error: failure));
          }
        }, (success) async {
          emit(ListownerPackagesState.listpackages(listCruise: success));
        });
      } catch (e) {
        emit(ListownerPackagesState.listpackagesFailure(
            error: 'An error occurred: $e'));
      }
    });
  }
}
