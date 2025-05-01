part of 'listowner_packages_bloc.dart';

@freezed
class ListownerPackagesState with _$ListownerPackagesState {
  const factory ListownerPackagesState.initial() = _Initial;
  const factory ListownerPackagesState.loading() = _Loading;
  const factory ListownerPackagesState.listpackages(
      {required List<ListMyCruiseModel> listCruise}) = _Listpackages;

  const factory ListownerPackagesState.listpackagesFailure(
      {required String error}) = ListpackagesFailure;
  const factory ListownerPackagesState.noInternet() = _NoInternet;
}
