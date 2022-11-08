import 'package:icecommercialpowertest/domain/domain.dart';

abstract class AuthRepository {
  Future<LoginResponseData> login(LoginRequestData loginRequestData);
  Future<String> register(SignUpRequestData registeRequestData);
  Future<String> updateProfile(requestData);
  //SetUpData
  Future<dynamic> setUp();
  Future<dynamic> getUser();
}
