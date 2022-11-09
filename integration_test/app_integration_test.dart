// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:icecommercialpowertest/presentation/presentation.dart';
// import 'package:integration_test/integration_test.dart';

// import 'package:icecommercialpowertest/main.dart' as app;

// void main() {
//   IntegrationTestWidgetsFlutterBinding.ensureInitialized();

//   Future<void> restoreFlutterError(Future<void> Function() call) async {
//     final originalOnError = FlutterError.onError!;
//     await call();
//     final overriddenOnError = FlutterError.onError!;
//     FlutterError.onError = (FlutterErrorDetails details) {
//       if (overriddenOnError != originalOnError) overriddenOnError(details);
//       originalOnError(details);
//     };
//   }

//   group('App Integration test', () {
//     testWidgets('', (tester) async {
//       app.main();
//       await tester.pumpAndSettle();
//       final Finder image = find.byType(Image);
//       expect(image, findsOneWidget);
//       await tester.pump(Duration(seconds: 5));
//       final loginWiget = find.byType(LoginPage);
//       expect(loginWiget, findsOneWidget);
//     });
//   });
// }


//   //   testWidgets("Ensure app moves to the logins screen after splashscreen",
//     //       (tester) async {});
//     // testWidgets('Open app and verify app open', (tester) async {
//     //   await restoreFlutterError(() async {
//     //     app.main();
//     //     await tester.pumpAndSettle();
//     //   });
//     //   await tester.pumpAndSettle();
//     //   final Finder image = find.byType(Image);
//     //   expect(image, findsOneWidget);
//     //   await tester.pump(Duration(seconds: 5));
//     //   //await tester.pumpAndSettle();
//     //   final loginWiget = find.byType(LoginPage);
//     //   expect(loginWiget, findsOneWidget);
//     // });