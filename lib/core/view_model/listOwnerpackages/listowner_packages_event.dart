part of 'listowner_packages_bloc.dart';

@freezed
class ListownerPackagesEvent with _$ListownerPackagesEvent {
  const factory ListownerPackagesEvent.started() = _Started;
  const factory ListownerPackagesEvent.listPackages() = _ListPackages;
}
