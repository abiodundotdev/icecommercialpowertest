// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'geolocation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Geolocation _$GeolocationFromJson(Map<String, dynamic> json) {
  return _Geolocation.fromJson(json);
}

/// @nodoc
mixin _$Geolocation {
  double? get lat => throw _privateConstructorUsedError;
  double? get long => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GeolocationCopyWith<Geolocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeolocationCopyWith<$Res> {
  factory $GeolocationCopyWith(
          Geolocation value, $Res Function(Geolocation) then) =
      _$GeolocationCopyWithImpl<$Res>;
  $Res call({double? lat, double? long});
}

/// @nodoc
class _$GeolocationCopyWithImpl<$Res> implements $GeolocationCopyWith<$Res> {
  _$GeolocationCopyWithImpl(this._value, this._then);

  final Geolocation _value;
  // ignore: unused_field
  final $Res Function(Geolocation) _then;

  @override
  $Res call({
    Object? lat = freezed,
    Object? long = freezed,
  }) {
    return _then(_value.copyWith(
      lat: lat == freezed
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      long: long == freezed
          ? _value.long
          : long // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
abstract class _$$_GeolocationCopyWith<$Res>
    implements $GeolocationCopyWith<$Res> {
  factory _$$_GeolocationCopyWith(
          _$_Geolocation value, $Res Function(_$_Geolocation) then) =
      __$$_GeolocationCopyWithImpl<$Res>;
  @override
  $Res call({double? lat, double? long});
}

/// @nodoc
class __$$_GeolocationCopyWithImpl<$Res> extends _$GeolocationCopyWithImpl<$Res>
    implements _$$_GeolocationCopyWith<$Res> {
  __$$_GeolocationCopyWithImpl(
      _$_Geolocation _value, $Res Function(_$_Geolocation) _then)
      : super(_value, (v) => _then(v as _$_Geolocation));

  @override
  _$_Geolocation get _value => super._value as _$_Geolocation;

  @override
  $Res call({
    Object? lat = freezed,
    Object? long = freezed,
  }) {
    return _then(_$_Geolocation(
      lat: lat == freezed
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      long: long == freezed
          ? _value.long
          : long // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Geolocation implements _Geolocation {
  _$_Geolocation({this.lat, this.long});

  factory _$_Geolocation.fromJson(Map<String, dynamic> json) =>
      _$$_GeolocationFromJson(json);

  @override
  final double? lat;
  @override
  final double? long;

  @override
  String toString() {
    return 'Geolocation(lat: $lat, long: $long)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Geolocation &&
            const DeepCollectionEquality().equals(other.lat, lat) &&
            const DeepCollectionEquality().equals(other.long, long));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(lat),
      const DeepCollectionEquality().hash(long));

  @JsonKey(ignore: true)
  @override
  _$$_GeolocationCopyWith<_$_Geolocation> get copyWith =>
      __$$_GeolocationCopyWithImpl<_$_Geolocation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GeolocationToJson(this);
  }
}

abstract class _Geolocation implements Geolocation {
  factory _Geolocation({final double? lat, final double? long}) =
      _$_Geolocation;

  factory _Geolocation.fromJson(Map<String, dynamic> json) =
      _$_Geolocation.fromJson;

  @override
  double? get lat;
  @override
  double? get long;
  @override
  @JsonKey(ignore: true)
  _$$_GeolocationCopyWith<_$_Geolocation> get copyWith =>
      throw _privateConstructorUsedError;
}
