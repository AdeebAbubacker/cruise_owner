// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_booking_by_owner_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CreateBookingByOwnerEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String packageId, String bookingTypeId,
            String startDate, String? endDate)
        getCruiseTypes,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String packageId, String bookingTypeId, String startDate,
            String? endDate)?
        getCruiseTypes,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String packageId, String bookingTypeId, String startDate,
            String? endDate)?
        getCruiseTypes,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_CreateBookingByOwnerEvents value) getCruiseTypes,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_CreateBookingByOwnerEvents value)? getCruiseTypes,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_CreateBookingByOwnerEvents value)? getCruiseTypes,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateBookingByOwnerEventCopyWith<$Res> {
  factory $CreateBookingByOwnerEventCopyWith(CreateBookingByOwnerEvent value,
          $Res Function(CreateBookingByOwnerEvent) then) =
      _$CreateBookingByOwnerEventCopyWithImpl<$Res, CreateBookingByOwnerEvent>;
}

/// @nodoc
class _$CreateBookingByOwnerEventCopyWithImpl<$Res,
        $Val extends CreateBookingByOwnerEvent>
    implements $CreateBookingByOwnerEventCopyWith<$Res> {
  _$CreateBookingByOwnerEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateBookingByOwnerEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$CreateBookingByOwnerEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateBookingByOwnerEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'CreateBookingByOwnerEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String packageId, String bookingTypeId,
            String startDate, String? endDate)
        getCruiseTypes,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String packageId, String bookingTypeId, String startDate,
            String? endDate)?
        getCruiseTypes,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String packageId, String bookingTypeId, String startDate,
            String? endDate)?
        getCruiseTypes,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_CreateBookingByOwnerEvents value) getCruiseTypes,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_CreateBookingByOwnerEvents value)? getCruiseTypes,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_CreateBookingByOwnerEvents value)? getCruiseTypes,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements CreateBookingByOwnerEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$CreateBookingByOwnerEventsImplCopyWith<$Res> {
  factory _$$CreateBookingByOwnerEventsImplCopyWith(
          _$CreateBookingByOwnerEventsImpl value,
          $Res Function(_$CreateBookingByOwnerEventsImpl) then) =
      __$$CreateBookingByOwnerEventsImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String packageId,
      String bookingTypeId,
      String startDate,
      String? endDate});
}

/// @nodoc
class __$$CreateBookingByOwnerEventsImplCopyWithImpl<$Res>
    extends _$CreateBookingByOwnerEventCopyWithImpl<$Res,
        _$CreateBookingByOwnerEventsImpl>
    implements _$$CreateBookingByOwnerEventsImplCopyWith<$Res> {
  __$$CreateBookingByOwnerEventsImplCopyWithImpl(
      _$CreateBookingByOwnerEventsImpl _value,
      $Res Function(_$CreateBookingByOwnerEventsImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateBookingByOwnerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? packageId = null,
    Object? bookingTypeId = null,
    Object? startDate = null,
    Object? endDate = freezed,
  }) {
    return _then(_$CreateBookingByOwnerEventsImpl(
      packageId: null == packageId
          ? _value.packageId
          : packageId // ignore: cast_nullable_to_non_nullable
              as String,
      bookingTypeId: null == bookingTypeId
          ? _value.bookingTypeId
          : bookingTypeId // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$CreateBookingByOwnerEventsImpl implements _CreateBookingByOwnerEvents {
  const _$CreateBookingByOwnerEventsImpl(
      {required this.packageId,
      required this.bookingTypeId,
      required this.startDate,
      this.endDate});

  @override
  final String packageId;
  @override
  final String bookingTypeId;
  @override
  final String startDate;
  @override
  final String? endDate;

  @override
  String toString() {
    return 'CreateBookingByOwnerEvent.getCruiseTypes(packageId: $packageId, bookingTypeId: $bookingTypeId, startDate: $startDate, endDate: $endDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateBookingByOwnerEventsImpl &&
            (identical(other.packageId, packageId) ||
                other.packageId == packageId) &&
            (identical(other.bookingTypeId, bookingTypeId) ||
                other.bookingTypeId == bookingTypeId) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, packageId, bookingTypeId, startDate, endDate);

  /// Create a copy of CreateBookingByOwnerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateBookingByOwnerEventsImplCopyWith<_$CreateBookingByOwnerEventsImpl>
      get copyWith => __$$CreateBookingByOwnerEventsImplCopyWithImpl<
          _$CreateBookingByOwnerEventsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String packageId, String bookingTypeId,
            String startDate, String? endDate)
        getCruiseTypes,
  }) {
    return getCruiseTypes(packageId, bookingTypeId, startDate, endDate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String packageId, String bookingTypeId, String startDate,
            String? endDate)?
        getCruiseTypes,
  }) {
    return getCruiseTypes?.call(packageId, bookingTypeId, startDate, endDate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String packageId, String bookingTypeId, String startDate,
            String? endDate)?
        getCruiseTypes,
    required TResult orElse(),
  }) {
    if (getCruiseTypes != null) {
      return getCruiseTypes(packageId, bookingTypeId, startDate, endDate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_CreateBookingByOwnerEvents value) getCruiseTypes,
  }) {
    return getCruiseTypes(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_CreateBookingByOwnerEvents value)? getCruiseTypes,
  }) {
    return getCruiseTypes?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_CreateBookingByOwnerEvents value)? getCruiseTypes,
    required TResult orElse(),
  }) {
    if (getCruiseTypes != null) {
      return getCruiseTypes(this);
    }
    return orElse();
  }
}

abstract class _CreateBookingByOwnerEvents
    implements CreateBookingByOwnerEvent {
  const factory _CreateBookingByOwnerEvents(
      {required final String packageId,
      required final String bookingTypeId,
      required final String startDate,
      final String? endDate}) = _$CreateBookingByOwnerEventsImpl;

  String get packageId;
  String get bookingTypeId;
  String get startDate;
  String? get endDate;

  /// Create a copy of CreateBookingByOwnerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateBookingByOwnerEventsImplCopyWith<_$CreateBookingByOwnerEventsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CreateBookingByOwnerState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String cruisetypemodel) getCruiseTypes,
    required TResult Function(String error) getCruiseTypesFailure,
    required TResult Function() noInternet,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String cruisetypemodel)? getCruiseTypes,
    TResult? Function(String error)? getCruiseTypesFailure,
    TResult? Function()? noInternet,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String cruisetypemodel)? getCruiseTypes,
    TResult Function(String error)? getCruiseTypesFailure,
    TResult Function()? noInternet,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_CreateOwnerBooking value) getCruiseTypes,
    required TResult Function(_CreateOwnerFailure value) getCruiseTypesFailure,
    required TResult Function(_NoInternet value) noInternet,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_CreateOwnerBooking value)? getCruiseTypes,
    TResult? Function(_CreateOwnerFailure value)? getCruiseTypesFailure,
    TResult? Function(_NoInternet value)? noInternet,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_CreateOwnerBooking value)? getCruiseTypes,
    TResult Function(_CreateOwnerFailure value)? getCruiseTypesFailure,
    TResult Function(_NoInternet value)? noInternet,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateBookingByOwnerStateCopyWith<$Res> {
  factory $CreateBookingByOwnerStateCopyWith(CreateBookingByOwnerState value,
          $Res Function(CreateBookingByOwnerState) then) =
      _$CreateBookingByOwnerStateCopyWithImpl<$Res, CreateBookingByOwnerState>;
}

/// @nodoc
class _$CreateBookingByOwnerStateCopyWithImpl<$Res,
        $Val extends CreateBookingByOwnerState>
    implements $CreateBookingByOwnerStateCopyWith<$Res> {
  _$CreateBookingByOwnerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateBookingByOwnerState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$CreateBookingByOwnerStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateBookingByOwnerState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'CreateBookingByOwnerState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String cruisetypemodel) getCruiseTypes,
    required TResult Function(String error) getCruiseTypesFailure,
    required TResult Function() noInternet,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String cruisetypemodel)? getCruiseTypes,
    TResult? Function(String error)? getCruiseTypesFailure,
    TResult? Function()? noInternet,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String cruisetypemodel)? getCruiseTypes,
    TResult Function(String error)? getCruiseTypesFailure,
    TResult Function()? noInternet,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_CreateOwnerBooking value) getCruiseTypes,
    required TResult Function(_CreateOwnerFailure value) getCruiseTypesFailure,
    required TResult Function(_NoInternet value) noInternet,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_CreateOwnerBooking value)? getCruiseTypes,
    TResult? Function(_CreateOwnerFailure value)? getCruiseTypesFailure,
    TResult? Function(_NoInternet value)? noInternet,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_CreateOwnerBooking value)? getCruiseTypes,
    TResult Function(_CreateOwnerFailure value)? getCruiseTypesFailure,
    TResult Function(_NoInternet value)? noInternet,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements CreateBookingByOwnerState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$CreateBookingByOwnerStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateBookingByOwnerState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'CreateBookingByOwnerState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String cruisetypemodel) getCruiseTypes,
    required TResult Function(String error) getCruiseTypesFailure,
    required TResult Function() noInternet,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String cruisetypemodel)? getCruiseTypes,
    TResult? Function(String error)? getCruiseTypesFailure,
    TResult? Function()? noInternet,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String cruisetypemodel)? getCruiseTypes,
    TResult Function(String error)? getCruiseTypesFailure,
    TResult Function()? noInternet,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_CreateOwnerBooking value) getCruiseTypes,
    required TResult Function(_CreateOwnerFailure value) getCruiseTypesFailure,
    required TResult Function(_NoInternet value) noInternet,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_CreateOwnerBooking value)? getCruiseTypes,
    TResult? Function(_CreateOwnerFailure value)? getCruiseTypesFailure,
    TResult? Function(_NoInternet value)? noInternet,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_CreateOwnerBooking value)? getCruiseTypes,
    TResult Function(_CreateOwnerFailure value)? getCruiseTypesFailure,
    TResult Function(_NoInternet value)? noInternet,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements CreateBookingByOwnerState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$CreateOwnerBookingImplCopyWith<$Res> {
  factory _$$CreateOwnerBookingImplCopyWith(_$CreateOwnerBookingImpl value,
          $Res Function(_$CreateOwnerBookingImpl) then) =
      __$$CreateOwnerBookingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String cruisetypemodel});
}

/// @nodoc
class __$$CreateOwnerBookingImplCopyWithImpl<$Res>
    extends _$CreateBookingByOwnerStateCopyWithImpl<$Res,
        _$CreateOwnerBookingImpl>
    implements _$$CreateOwnerBookingImplCopyWith<$Res> {
  __$$CreateOwnerBookingImplCopyWithImpl(_$CreateOwnerBookingImpl _value,
      $Res Function(_$CreateOwnerBookingImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateBookingByOwnerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cruisetypemodel = null,
  }) {
    return _then(_$CreateOwnerBookingImpl(
      cruisetypemodel: null == cruisetypemodel
          ? _value.cruisetypemodel
          : cruisetypemodel // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CreateOwnerBookingImpl implements _CreateOwnerBooking {
  const _$CreateOwnerBookingImpl({required this.cruisetypemodel});

  @override
  final String cruisetypemodel;

  @override
  String toString() {
    return 'CreateBookingByOwnerState.getCruiseTypes(cruisetypemodel: $cruisetypemodel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateOwnerBookingImpl &&
            (identical(other.cruisetypemodel, cruisetypemodel) ||
                other.cruisetypemodel == cruisetypemodel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cruisetypemodel);

  /// Create a copy of CreateBookingByOwnerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateOwnerBookingImplCopyWith<_$CreateOwnerBookingImpl> get copyWith =>
      __$$CreateOwnerBookingImplCopyWithImpl<_$CreateOwnerBookingImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String cruisetypemodel) getCruiseTypes,
    required TResult Function(String error) getCruiseTypesFailure,
    required TResult Function() noInternet,
  }) {
    return getCruiseTypes(cruisetypemodel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String cruisetypemodel)? getCruiseTypes,
    TResult? Function(String error)? getCruiseTypesFailure,
    TResult? Function()? noInternet,
  }) {
    return getCruiseTypes?.call(cruisetypemodel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String cruisetypemodel)? getCruiseTypes,
    TResult Function(String error)? getCruiseTypesFailure,
    TResult Function()? noInternet,
    required TResult orElse(),
  }) {
    if (getCruiseTypes != null) {
      return getCruiseTypes(cruisetypemodel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_CreateOwnerBooking value) getCruiseTypes,
    required TResult Function(_CreateOwnerFailure value) getCruiseTypesFailure,
    required TResult Function(_NoInternet value) noInternet,
  }) {
    return getCruiseTypes(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_CreateOwnerBooking value)? getCruiseTypes,
    TResult? Function(_CreateOwnerFailure value)? getCruiseTypesFailure,
    TResult? Function(_NoInternet value)? noInternet,
  }) {
    return getCruiseTypes?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_CreateOwnerBooking value)? getCruiseTypes,
    TResult Function(_CreateOwnerFailure value)? getCruiseTypesFailure,
    TResult Function(_NoInternet value)? noInternet,
    required TResult orElse(),
  }) {
    if (getCruiseTypes != null) {
      return getCruiseTypes(this);
    }
    return orElse();
  }
}

abstract class _CreateOwnerBooking implements CreateBookingByOwnerState {
  const factory _CreateOwnerBooking({required final String cruisetypemodel}) =
      _$CreateOwnerBookingImpl;

  String get cruisetypemodel;

  /// Create a copy of CreateBookingByOwnerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateOwnerBookingImplCopyWith<_$CreateOwnerBookingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateOwnerFailureImplCopyWith<$Res> {
  factory _$$CreateOwnerFailureImplCopyWith(_$CreateOwnerFailureImpl value,
          $Res Function(_$CreateOwnerFailureImpl) then) =
      __$$CreateOwnerFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$CreateOwnerFailureImplCopyWithImpl<$Res>
    extends _$CreateBookingByOwnerStateCopyWithImpl<$Res,
        _$CreateOwnerFailureImpl>
    implements _$$CreateOwnerFailureImplCopyWith<$Res> {
  __$$CreateOwnerFailureImplCopyWithImpl(_$CreateOwnerFailureImpl _value,
      $Res Function(_$CreateOwnerFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateBookingByOwnerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$CreateOwnerFailureImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CreateOwnerFailureImpl implements _CreateOwnerFailure {
  const _$CreateOwnerFailureImpl({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'CreateBookingByOwnerState.getCruiseTypesFailure(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateOwnerFailureImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of CreateBookingByOwnerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateOwnerFailureImplCopyWith<_$CreateOwnerFailureImpl> get copyWith =>
      __$$CreateOwnerFailureImplCopyWithImpl<_$CreateOwnerFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String cruisetypemodel) getCruiseTypes,
    required TResult Function(String error) getCruiseTypesFailure,
    required TResult Function() noInternet,
  }) {
    return getCruiseTypesFailure(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String cruisetypemodel)? getCruiseTypes,
    TResult? Function(String error)? getCruiseTypesFailure,
    TResult? Function()? noInternet,
  }) {
    return getCruiseTypesFailure?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String cruisetypemodel)? getCruiseTypes,
    TResult Function(String error)? getCruiseTypesFailure,
    TResult Function()? noInternet,
    required TResult orElse(),
  }) {
    if (getCruiseTypesFailure != null) {
      return getCruiseTypesFailure(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_CreateOwnerBooking value) getCruiseTypes,
    required TResult Function(_CreateOwnerFailure value) getCruiseTypesFailure,
    required TResult Function(_NoInternet value) noInternet,
  }) {
    return getCruiseTypesFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_CreateOwnerBooking value)? getCruiseTypes,
    TResult? Function(_CreateOwnerFailure value)? getCruiseTypesFailure,
    TResult? Function(_NoInternet value)? noInternet,
  }) {
    return getCruiseTypesFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_CreateOwnerBooking value)? getCruiseTypes,
    TResult Function(_CreateOwnerFailure value)? getCruiseTypesFailure,
    TResult Function(_NoInternet value)? noInternet,
    required TResult orElse(),
  }) {
    if (getCruiseTypesFailure != null) {
      return getCruiseTypesFailure(this);
    }
    return orElse();
  }
}

abstract class _CreateOwnerFailure implements CreateBookingByOwnerState {
  const factory _CreateOwnerFailure({required final String error}) =
      _$CreateOwnerFailureImpl;

  String get error;

  /// Create a copy of CreateBookingByOwnerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateOwnerFailureImplCopyWith<_$CreateOwnerFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NoInternetImplCopyWith<$Res> {
  factory _$$NoInternetImplCopyWith(
          _$NoInternetImpl value, $Res Function(_$NoInternetImpl) then) =
      __$$NoInternetImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NoInternetImplCopyWithImpl<$Res>
    extends _$CreateBookingByOwnerStateCopyWithImpl<$Res, _$NoInternetImpl>
    implements _$$NoInternetImplCopyWith<$Res> {
  __$$NoInternetImplCopyWithImpl(
      _$NoInternetImpl _value, $Res Function(_$NoInternetImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateBookingByOwnerState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$NoInternetImpl implements _NoInternet {
  const _$NoInternetImpl();

  @override
  String toString() {
    return 'CreateBookingByOwnerState.noInternet()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NoInternetImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String cruisetypemodel) getCruiseTypes,
    required TResult Function(String error) getCruiseTypesFailure,
    required TResult Function() noInternet,
  }) {
    return noInternet();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String cruisetypemodel)? getCruiseTypes,
    TResult? Function(String error)? getCruiseTypesFailure,
    TResult? Function()? noInternet,
  }) {
    return noInternet?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String cruisetypemodel)? getCruiseTypes,
    TResult Function(String error)? getCruiseTypesFailure,
    TResult Function()? noInternet,
    required TResult orElse(),
  }) {
    if (noInternet != null) {
      return noInternet();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_CreateOwnerBooking value) getCruiseTypes,
    required TResult Function(_CreateOwnerFailure value) getCruiseTypesFailure,
    required TResult Function(_NoInternet value) noInternet,
  }) {
    return noInternet(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_CreateOwnerBooking value)? getCruiseTypes,
    TResult? Function(_CreateOwnerFailure value)? getCruiseTypesFailure,
    TResult? Function(_NoInternet value)? noInternet,
  }) {
    return noInternet?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_CreateOwnerBooking value)? getCruiseTypes,
    TResult Function(_CreateOwnerFailure value)? getCruiseTypesFailure,
    TResult Function(_NoInternet value)? noInternet,
    required TResult orElse(),
  }) {
    if (noInternet != null) {
      return noInternet(this);
    }
    return orElse();
  }
}

abstract class _NoInternet implements CreateBookingByOwnerState {
  const factory _NoInternet() = _$NoInternetImpl;
}
