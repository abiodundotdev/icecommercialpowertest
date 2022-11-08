// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geolocation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Geolocation _$$_GeolocationFromJson(Map<String, dynamic> json) =>
    _$_Geolocation(
      lat: (json['lat'] as num?)?.toDouble(),
      long: (json['long'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_GeolocationToJson(_$_Geolocation instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'long': instance.long,
    };
