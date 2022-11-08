import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:icecommercialpowertest/core/exceptions.dart';
import 'package:icecommercialpowertest/domain/domain.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_repository_test.mocks.dart';

@GenerateMocks([AuthRepository])
void main() {
  late MockAuthRepository authRepository;
  setUp(() {
    authRepository = MockAuthRepository();
  });

  group("Auth repoitory test", () {
    const String correctUsername = "softedok";
    const String correctPassword = "12345";
    test('User logged successfully', () async {
      final loginRequestData = LoginRequestData(
          username: correctUsername, password: correctPassword);
      final user = UserModel();
      when(authRepository.login(loginRequestData)).thenAnswer(
        (inv) => Future.value(
            LoginResponseData(user: user, token: "token", message: "message")),
      );
      expect(
        await authRepository.login(loginRequestData),
        isA<LoginResponseData>(),
      );
    });

    test('User registered successfully', () async {
      final signUpRequestData = SignUpRequestData(
          username: correctUsername, password: correctPassword);
      when(authRepository.register(signUpRequestData)).thenAnswer(
        (inv) => Future.value("Success"),
      );
      expect(
        await authRepository.register(signUpRequestData),
        isA<String>(),
      );
    });
  });
}
