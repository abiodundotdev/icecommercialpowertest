import 'package:icecommercialpowertest/domain/domain.dart';

class LoginResponseData {
  LoginResponseData({
    required this.user,
    required this.token,
    required this.message,
  });

  final UserModel user;
  final String token;
  final String? message;

  factory LoginResponseData.fromJson(Map json) {
    return LoginResponseData(
      user: UserModel.fromJson(json['user']),
      token: json['token'],
      message: json['message'],
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoginResponseData &&
          runtimeType == other.runtimeType &&
          user == other.user &&
          token == other.token &&
          message == other.message;

  @override
  int get hashCode => user.hashCode ^ token.hashCode ^ message.hashCode;

  @override
  String toString() {
    return "LoginResponseData(user : $user, token: $token, message : $message)";
  }
}
