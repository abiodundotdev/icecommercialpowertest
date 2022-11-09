// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:icecommercialpowertest/domain/domain.dart';
// import 'package:icecommercialpowertest/presentation/presentation.dart';
// import 'package:mockito/mockito.dart';

// import '../repository/auth_repository_test.mocks.dart';

// void main() {
//   Widget makeTestableWidget(Widget child) {
//     return MaterialApp(
//       home: child,
//     );
//   }

//   late MockAuthRepository mockAuth;
//   late Widget loginPage;
//   setUp(() {
//     mockAuth = MockAuthRepository();
//     loginPage = LoginPage();
//   });

//   group("Login page test", () {
//     testWidgets('Verify Login page shows up', (WidgetTester tester) async {
//       await tester.pumpWidget(makeTestableWidget(loginPage));

//       final userNameField = find.byKey(const Key("usernameInput"));

//       final passwordField = find.byKey(const Key("passwordInput"));

//       final loginInButton = find.byKey(const Key("signIn"));

//       expect(userNameField, findsOneWidget);
//       expect(passwordField, findsOneWidget);
//       expect(loginInButton, findsOneWidget);
//     });
//     testWidgets('email or password is empty, does not sign in',
//         (WidgetTester tester) async {
//       await tester.pumpWidget(makeTestableWidget(loginPage));
//       final userNameField = find.byKey(Key("usernameInput"));

//       final passwordField = find.byKey(Key("passwordInput"));

//       final loginInButton = find.byKey(Key("signIn"));

//       await tester.tap(loginInButton);
//       verifyNever(mockAuth.login(LoginRequestData()));

//       expect(userNameField, findsOneWidget);
//       expect(passwordField, findsOneWidget);
//       expect(loginInButton, findsOneWidget);
//     });

//     testWidgets(
//         'non-empty email and password, valid account, call sign in, succeed',
//         (WidgetTester tester) async {
//       when(mockAuth.login(LoginRequestData())).thenAnswer(
//         (inv) => Future.value(LoginResponseData(
//             user: UserModel(), token: "token", message: "message")),
//       );
//       await tester.pumpWidget(makeTestableWidget(loginPage));

//       Finder emailField = find.byKey(Key('username'));
//       await tester.enterText(emailField, 'email');

//       Finder passwordField = find.byKey(Key('password'));
//       await tester.enterText(passwordField, 'password');

//       await tester.tap(find.byKey(Key('signIn')));

//       verify(mockAuth.login(LoginRequestData())).called(1);
//     });
//   });
// }
