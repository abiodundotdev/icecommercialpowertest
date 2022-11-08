// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'dashboard_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DashboardState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(DashBoardData data) completed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(DashBoardData data)? completed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(DashBoardData data)? completed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DashBoardLoading value) loading,
    required TResult Function(DashboardError value) error,
    required TResult Function(DashboardCompleted value) completed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DashBoardLoading value)? loading,
    TResult Function(DashboardError value)? error,
    TResult Function(DashboardCompleted value)? completed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DashBoardLoading value)? loading,
    TResult Function(DashboardError value)? error,
    TResult Function(DashboardCompleted value)? completed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardStateCopyWith<$Res> {
  factory $DashboardStateCopyWith(
          DashboardState value, $Res Function(DashboardState) then) =
      _$DashboardStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$DashboardStateCopyWithImpl<$Res>
    implements $DashboardStateCopyWith<$Res> {
  _$DashboardStateCopyWithImpl(this._value, this._then);

  final DashboardState _value;
  // ignore: unused_field
  final $Res Function(DashboardState) _then;
}

/// @nodoc
abstract class _$$DashBoardLoadingCopyWith<$Res> {
  factory _$$DashBoardLoadingCopyWith(
          _$DashBoardLoading value, $Res Function(_$DashBoardLoading) then) =
      __$$DashBoardLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DashBoardLoadingCopyWithImpl<$Res>
    extends _$DashboardStateCopyWithImpl<$Res>
    implements _$$DashBoardLoadingCopyWith<$Res> {
  __$$DashBoardLoadingCopyWithImpl(
      _$DashBoardLoading _value, $Res Function(_$DashBoardLoading) _then)
      : super(_value, (v) => _then(v as _$DashBoardLoading));

  @override
  _$DashBoardLoading get _value => super._value as _$DashBoardLoading;
}

/// @nodoc

class _$DashBoardLoading implements DashBoardLoading {
  const _$DashBoardLoading();

  @override
  String toString() {
    return 'DashboardState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DashBoardLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(DashBoardData data) completed,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(DashBoardData data)? completed,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(DashBoardData data)? completed,
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
    required TResult Function(DashBoardLoading value) loading,
    required TResult Function(DashboardError value) error,
    required TResult Function(DashboardCompleted value) completed,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DashBoardLoading value)? loading,
    TResult Function(DashboardError value)? error,
    TResult Function(DashboardCompleted value)? completed,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DashBoardLoading value)? loading,
    TResult Function(DashboardError value)? error,
    TResult Function(DashboardCompleted value)? completed,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class DashBoardLoading implements DashboardState {
  const factory DashBoardLoading() = _$DashBoardLoading;
}

/// @nodoc
abstract class _$$DashboardErrorCopyWith<$Res> {
  factory _$$DashboardErrorCopyWith(
          _$DashboardError value, $Res Function(_$DashboardError) then) =
      __$$DashboardErrorCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class __$$DashboardErrorCopyWithImpl<$Res>
    extends _$DashboardStateCopyWithImpl<$Res>
    implements _$$DashboardErrorCopyWith<$Res> {
  __$$DashboardErrorCopyWithImpl(
      _$DashboardError _value, $Res Function(_$DashboardError) _then)
      : super(_value, (v) => _then(v as _$DashboardError));

  @override
  _$DashboardError get _value => super._value as _$DashboardError;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$DashboardError(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DashboardError implements DashboardError {
  const _$DashboardError(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'DashboardState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardError &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$DashboardErrorCopyWith<_$DashboardError> get copyWith =>
      __$$DashboardErrorCopyWithImpl<_$DashboardError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(DashBoardData data) completed,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(DashBoardData data)? completed,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(DashBoardData data)? completed,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DashBoardLoading value) loading,
    required TResult Function(DashboardError value) error,
    required TResult Function(DashboardCompleted value) completed,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DashBoardLoading value)? loading,
    TResult Function(DashboardError value)? error,
    TResult Function(DashboardCompleted value)? completed,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DashBoardLoading value)? loading,
    TResult Function(DashboardError value)? error,
    TResult Function(DashboardCompleted value)? completed,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class DashboardError implements DashboardState {
  const factory DashboardError(final String message) = _$DashboardError;

  String get message;
  @JsonKey(ignore: true)
  _$$DashboardErrorCopyWith<_$DashboardError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DashboardCompletedCopyWith<$Res> {
  factory _$$DashboardCompletedCopyWith(_$DashboardCompleted value,
          $Res Function(_$DashboardCompleted) then) =
      __$$DashboardCompletedCopyWithImpl<$Res>;
  $Res call({DashBoardData data});

  $DashBoardDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$DashboardCompletedCopyWithImpl<$Res>
    extends _$DashboardStateCopyWithImpl<$Res>
    implements _$$DashboardCompletedCopyWith<$Res> {
  __$$DashboardCompletedCopyWithImpl(
      _$DashboardCompleted _value, $Res Function(_$DashboardCompleted) _then)
      : super(_value, (v) => _then(v as _$DashboardCompleted));

  @override
  _$DashboardCompleted get _value => super._value as _$DashboardCompleted;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$DashboardCompleted(
      data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as DashBoardData,
    ));
  }

  @override
  $DashBoardDataCopyWith<$Res> get data {
    return $DashBoardDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value));
    });
  }
}

/// @nodoc

class _$DashboardCompleted implements DashboardCompleted {
  const _$DashboardCompleted(this.data);

  @override
  final DashBoardData data;

  @override
  String toString() {
    return 'DashboardState.completed(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardCompleted &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  _$$DashboardCompletedCopyWith<_$DashboardCompleted> get copyWith =>
      __$$DashboardCompletedCopyWithImpl<_$DashboardCompleted>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(DashBoardData data) completed,
  }) {
    return completed(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(DashBoardData data)? completed,
  }) {
    return completed?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(DashBoardData data)? completed,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DashBoardLoading value) loading,
    required TResult Function(DashboardError value) error,
    required TResult Function(DashboardCompleted value) completed,
  }) {
    return completed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DashBoardLoading value)? loading,
    TResult Function(DashboardError value)? error,
    TResult Function(DashboardCompleted value)? completed,
  }) {
    return completed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DashBoardLoading value)? loading,
    TResult Function(DashboardError value)? error,
    TResult Function(DashboardCompleted value)? completed,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed(this);
    }
    return orElse();
  }
}

abstract class DashboardCompleted implements DashboardState {
  const factory DashboardCompleted(final DashBoardData data) =
      _$DashboardCompleted;

  DashBoardData get data;
  @JsonKey(ignore: true)
  _$$DashboardCompletedCopyWith<_$DashboardCompleted> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DashboardEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchDashboard value) fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FetchDashboard value)? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchDashboard value)? fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardEventCopyWith<$Res> {
  factory $DashboardEventCopyWith(
          DashboardEvent value, $Res Function(DashboardEvent) then) =
      _$DashboardEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$DashboardEventCopyWithImpl<$Res>
    implements $DashboardEventCopyWith<$Res> {
  _$DashboardEventCopyWithImpl(this._value, this._then);

  final DashboardEvent _value;
  // ignore: unused_field
  final $Res Function(DashboardEvent) _then;
}

/// @nodoc
abstract class _$$FetchDashboardCopyWith<$Res> {
  factory _$$FetchDashboardCopyWith(
          _$FetchDashboard value, $Res Function(_$FetchDashboard) then) =
      __$$FetchDashboardCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchDashboardCopyWithImpl<$Res>
    extends _$DashboardEventCopyWithImpl<$Res>
    implements _$$FetchDashboardCopyWith<$Res> {
  __$$FetchDashboardCopyWithImpl(
      _$FetchDashboard _value, $Res Function(_$FetchDashboard) _then)
      : super(_value, (v) => _then(v as _$FetchDashboard));

  @override
  _$FetchDashboard get _value => super._value as _$FetchDashboard;
}

/// @nodoc

class _$FetchDashboard implements FetchDashboard {
  const _$FetchDashboard();

  @override
  String toString() {
    return 'DashboardEvent.fetch()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchDashboard);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
  }) {
    return fetch();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? fetch,
  }) {
    return fetch?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchDashboard value) fetch,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FetchDashboard value)? fetch,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchDashboard value)? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class FetchDashboard implements DashboardEvent {
  const factory FetchDashboard() = _$FetchDashboard;
}
