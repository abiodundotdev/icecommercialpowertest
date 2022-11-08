// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'cart_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CartState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(List<CartModel> items) completed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(List<CartModel> items)? completed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(List<CartModel> items)? completed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CartLoading value) loading,
    required TResult Function(CartError value) error,
    required TResult Function(CartCompleted value) completed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CartLoading value)? loading,
    TResult Function(CartError value)? error,
    TResult Function(CartCompleted value)? completed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CartLoading value)? loading,
    TResult Function(CartError value)? error,
    TResult Function(CartCompleted value)? completed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartStateCopyWith<$Res> {
  factory $CartStateCopyWith(CartState value, $Res Function(CartState) then) =
      _$CartStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$CartStateCopyWithImpl<$Res> implements $CartStateCopyWith<$Res> {
  _$CartStateCopyWithImpl(this._value, this._then);

  final CartState _value;
  // ignore: unused_field
  final $Res Function(CartState) _then;
}

/// @nodoc
abstract class _$$CartLoadingCopyWith<$Res> {
  factory _$$CartLoadingCopyWith(
          _$CartLoading value, $Res Function(_$CartLoading) then) =
      __$$CartLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CartLoadingCopyWithImpl<$Res> extends _$CartStateCopyWithImpl<$Res>
    implements _$$CartLoadingCopyWith<$Res> {
  __$$CartLoadingCopyWithImpl(
      _$CartLoading _value, $Res Function(_$CartLoading) _then)
      : super(_value, (v) => _then(v as _$CartLoading));

  @override
  _$CartLoading get _value => super._value as _$CartLoading;
}

/// @nodoc

class _$CartLoading implements CartLoading {
  const _$CartLoading();

  @override
  String toString() {
    return 'CartState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CartLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(List<CartModel> items) completed,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(List<CartModel> items)? completed,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(List<CartModel> items)? completed,
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
    required TResult Function(CartLoading value) loading,
    required TResult Function(CartError value) error,
    required TResult Function(CartCompleted value) completed,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CartLoading value)? loading,
    TResult Function(CartError value)? error,
    TResult Function(CartCompleted value)? completed,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CartLoading value)? loading,
    TResult Function(CartError value)? error,
    TResult Function(CartCompleted value)? completed,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class CartLoading implements CartState {
  const factory CartLoading() = _$CartLoading;
}

/// @nodoc
abstract class _$$CartErrorCopyWith<$Res> {
  factory _$$CartErrorCopyWith(
          _$CartError value, $Res Function(_$CartError) then) =
      __$$CartErrorCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class __$$CartErrorCopyWithImpl<$Res> extends _$CartStateCopyWithImpl<$Res>
    implements _$$CartErrorCopyWith<$Res> {
  __$$CartErrorCopyWithImpl(
      _$CartError _value, $Res Function(_$CartError) _then)
      : super(_value, (v) => _then(v as _$CartError));

  @override
  _$CartError get _value => super._value as _$CartError;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$CartError(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CartError implements CartError {
  const _$CartError(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'CartState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartError &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$CartErrorCopyWith<_$CartError> get copyWith =>
      __$$CartErrorCopyWithImpl<_$CartError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(List<CartModel> items) completed,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(List<CartModel> items)? completed,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(List<CartModel> items)? completed,
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
    required TResult Function(CartLoading value) loading,
    required TResult Function(CartError value) error,
    required TResult Function(CartCompleted value) completed,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CartLoading value)? loading,
    TResult Function(CartError value)? error,
    TResult Function(CartCompleted value)? completed,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CartLoading value)? loading,
    TResult Function(CartError value)? error,
    TResult Function(CartCompleted value)? completed,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class CartError implements CartState {
  const factory CartError(final String message) = _$CartError;

  String get message;
  @JsonKey(ignore: true)
  _$$CartErrorCopyWith<_$CartError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CartCompletedCopyWith<$Res> {
  factory _$$CartCompletedCopyWith(
          _$CartCompleted value, $Res Function(_$CartCompleted) then) =
      __$$CartCompletedCopyWithImpl<$Res>;
  $Res call({List<CartModel> items});
}

/// @nodoc
class __$$CartCompletedCopyWithImpl<$Res> extends _$CartStateCopyWithImpl<$Res>
    implements _$$CartCompletedCopyWith<$Res> {
  __$$CartCompletedCopyWithImpl(
      _$CartCompleted _value, $Res Function(_$CartCompleted) _then)
      : super(_value, (v) => _then(v as _$CartCompleted));

  @override
  _$CartCompleted get _value => super._value as _$CartCompleted;

  @override
  $Res call({
    Object? items = freezed,
  }) {
    return _then(_$CartCompleted(
      items == freezed
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CartModel>,
    ));
  }
}

/// @nodoc

class _$CartCompleted implements CartCompleted {
  const _$CartCompleted(final List<CartModel> items) : _items = items;

  final List<CartModel> _items;
  @override
  List<CartModel> get items {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'CartState.completed(items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartCompleted &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  _$$CartCompletedCopyWith<_$CartCompleted> get copyWith =>
      __$$CartCompletedCopyWithImpl<_$CartCompleted>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(List<CartModel> items) completed,
  }) {
    return completed(items);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(List<CartModel> items)? completed,
  }) {
    return completed?.call(items);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(List<CartModel> items)? completed,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed(items);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CartLoading value) loading,
    required TResult Function(CartError value) error,
    required TResult Function(CartCompleted value) completed,
  }) {
    return completed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CartLoading value)? loading,
    TResult Function(CartError value)? error,
    TResult Function(CartCompleted value)? completed,
  }) {
    return completed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CartLoading value)? loading,
    TResult Function(CartError value)? error,
    TResult Function(CartCompleted value)? completed,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed(this);
    }
    return orElse();
  }
}

abstract class CartCompleted implements CartState {
  const factory CartCompleted(final List<CartModel> items) = _$CartCompleted;

  List<CartModel> get items;
  @JsonKey(ignore: true)
  _$$CartCompletedCopyWith<_$CartCompleted> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CartEvent {
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
    required TResult Function(FetchCart value) fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FetchCart value)? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchCart value)? fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartEventCopyWith<$Res> {
  factory $CartEventCopyWith(CartEvent value, $Res Function(CartEvent) then) =
      _$CartEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$CartEventCopyWithImpl<$Res> implements $CartEventCopyWith<$Res> {
  _$CartEventCopyWithImpl(this._value, this._then);

  final CartEvent _value;
  // ignore: unused_field
  final $Res Function(CartEvent) _then;
}

/// @nodoc
abstract class _$$FetchCartCopyWith<$Res> {
  factory _$$FetchCartCopyWith(
          _$FetchCart value, $Res Function(_$FetchCart) then) =
      __$$FetchCartCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchCartCopyWithImpl<$Res> extends _$CartEventCopyWithImpl<$Res>
    implements _$$FetchCartCopyWith<$Res> {
  __$$FetchCartCopyWithImpl(
      _$FetchCart _value, $Res Function(_$FetchCart) _then)
      : super(_value, (v) => _then(v as _$FetchCart));

  @override
  _$FetchCart get _value => super._value as _$FetchCart;
}

/// @nodoc

class _$FetchCart implements FetchCart {
  const _$FetchCart();

  @override
  String toString() {
    return 'CartEvent.fetch()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchCart);
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
    required TResult Function(FetchCart value) fetch,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FetchCart value)? fetch,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchCart value)? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class FetchCart implements CartEvent {
  const factory FetchCart() = _$FetchCart;
}
