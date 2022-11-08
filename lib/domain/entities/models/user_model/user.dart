import 'package:freezed_annotation/freezed_annotation.dart';

import 'address.dart';
import 'name.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class UserModel with _$UserModel {
  factory UserModel({
    int? id,
    String? email,
    String? username,
    String? password,
    Name? name,
    Address? address,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
