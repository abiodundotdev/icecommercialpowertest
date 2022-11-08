import 'package:freezed_annotation/freezed_annotation.dart';

import 'geolocation.dart';

part 'address.freezed.dart';
part 'address.g.dart';

@freezed
class Address with _$Address {
  factory Address({
    String? city,
    String? street,
    int? number,
    String? zipcode,
    Geolocation? geolocation,
  }) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}
