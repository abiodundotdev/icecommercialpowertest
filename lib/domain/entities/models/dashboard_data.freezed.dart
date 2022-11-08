// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'dashboard_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DashBoardData _$DashBoardDataFromJson(Map<String, dynamic> json) {
  return _DashBoardData.fromJson(json);
}

/// @nodoc
mixin _$DashBoardData {
  List<String>? get categories => throw _privateConstructorUsedError;
  List<ProductModel>? get products => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DashBoardDataCopyWith<DashBoardData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashBoardDataCopyWith<$Res> {
  factory $DashBoardDataCopyWith(
          DashBoardData value, $Res Function(DashBoardData) then) =
      _$DashBoardDataCopyWithImpl<$Res>;
  $Res call({List<String>? categories, List<ProductModel>? products});
}

/// @nodoc
class _$DashBoardDataCopyWithImpl<$Res>
    implements $DashBoardDataCopyWith<$Res> {
  _$DashBoardDataCopyWithImpl(this._value, this._then);

  final DashBoardData _value;
  // ignore: unused_field
  final $Res Function(DashBoardData) _then;

  @override
  $Res call({
    Object? categories = freezed,
    Object? products = freezed,
  }) {
    return _then(_value.copyWith(
      categories: categories == freezed
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      products: products == freezed
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>?,
    ));
  }
}

/// @nodoc
abstract class _$$_DashBoardDataCopyWith<$Res>
    implements $DashBoardDataCopyWith<$Res> {
  factory _$$_DashBoardDataCopyWith(
          _$_DashBoardData value, $Res Function(_$_DashBoardData) then) =
      __$$_DashBoardDataCopyWithImpl<$Res>;
  @override
  $Res call({List<String>? categories, List<ProductModel>? products});
}

/// @nodoc
class __$$_DashBoardDataCopyWithImpl<$Res>
    extends _$DashBoardDataCopyWithImpl<$Res>
    implements _$$_DashBoardDataCopyWith<$Res> {
  __$$_DashBoardDataCopyWithImpl(
      _$_DashBoardData _value, $Res Function(_$_DashBoardData) _then)
      : super(_value, (v) => _then(v as _$_DashBoardData));

  @override
  _$_DashBoardData get _value => super._value as _$_DashBoardData;

  @override
  $Res call({
    Object? categories = freezed,
    Object? products = freezed,
  }) {
    return _then(_$_DashBoardData(
      categories: categories == freezed
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      products: products == freezed
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DashBoardData implements _DashBoardData {
  _$_DashBoardData(
      {final List<String>? categories, final List<ProductModel>? products})
      : _categories = categories,
        _products = products;

  factory _$_DashBoardData.fromJson(Map<String, dynamic> json) =>
      _$$_DashBoardDataFromJson(json);

  final List<String>? _categories;
  @override
  List<String>? get categories {
    final value = _categories;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ProductModel>? _products;
  @override
  List<ProductModel>? get products {
    final value = _products;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'DashBoardData(categories: $categories, products: $products)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DashBoardData &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_categories),
      const DeepCollectionEquality().hash(_products));

  @JsonKey(ignore: true)
  @override
  _$$_DashBoardDataCopyWith<_$_DashBoardData> get copyWith =>
      __$$_DashBoardDataCopyWithImpl<_$_DashBoardData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DashBoardDataToJson(this);
  }
}

abstract class _DashBoardData implements DashBoardData {
  factory _DashBoardData(
      {final List<String>? categories,
      final List<ProductModel>? products}) = _$_DashBoardData;

  factory _DashBoardData.fromJson(Map<String, dynamic> json) =
      _$_DashBoardData.fromJson;

  @override
  List<String>? get categories;
  @override
  List<ProductModel>? get products;
  @override
  @JsonKey(ignore: true)
  _$$_DashBoardDataCopyWith<_$_DashBoardData> get copyWith =>
      throw _privateConstructorUsedError;
}
