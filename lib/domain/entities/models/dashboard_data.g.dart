// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DashBoardData _$$_DashBoardDataFromJson(Map<String, dynamic> json) =>
    _$_DashBoardData(
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_DashBoardDataToJson(_$_DashBoardData instance) =>
    <String, dynamic>{
      'categories': instance.categories,
      'products': instance.products,
    };
