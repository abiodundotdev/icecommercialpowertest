import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:icecommercialpowertest/presentation/presentation.dart';
import 'package:integration_test/integration_test.dart';

import 'package:icecommercialpowertest/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Integration test', () {
    testWidgets('Open app and verify app open', (tester) async {
      app.main();
      await tester.pumpAndSettle();
      final Finder image = find.byType(Image);
      expect(image, findsOneWidget);
      await tester.pump(const Duration(seconds: 4));
      final loginWiget = find.byType(LoginPage);
      expect(loginWiget, findsOneWidget);
    });
  });
}
