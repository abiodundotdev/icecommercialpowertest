import 'package:dio/dio.dart';
import 'package:icecommercialpowertest/core/core.dart';
import 'package:icecommercialpowertest/domain/domain.dart';

class AuthRepositoryImplement implements AuthRepository {
  final AppHttpClient httpClient;
  AuthRepositoryImplement(this.httpClient);
  @override
  Future getUser() {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  Future<LoginResponseData> login(LoginRequestData loginRequestData) async {
    final res =
        await httpClient.post(Endpoints.login, loginRequestData.toMap());
    return LoginResponseData(
      token: "",
      message: "",
      user: UserModel(),
    );
  }

  @override
  Future<String> register(SignUpRequestData registeRequestData) async {
    return "Success";
  }

  @override
  Future setUp() {
    // TODO: implement setUp
    throw UnimplementedError();
  }

  @override
  Future<String> updateProfile(requestData) {
    // TODO: implement updateProfile
    throw UnimplementedError();
  }
}
