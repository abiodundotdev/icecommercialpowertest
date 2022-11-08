import 'package:flutter/material.dart' show MaterialColor;
import 'package:flutter/widgets.dart';

class AppColors {
  static const _basePrimary = 0xFFF67952;

  static const MaterialColor dark = MaterialColor(
    0xFF444444,
    <int, Color>{
      50: Color(0xFFfafafa),
      100: Color(0xFFf5f5f5),
      200: Color(0xFFefefef),
      300: Color(0xFFe2e2e2),
      400: Color(0xFFbfbfbf),
      500: Color(0xFFa0a0a0),
      600: Color(0xFF777777),
      700: Color(0xFF636363),
      800: Color(0xFF444444),
      900: Color(0xFF232323),
    },
  );
  static const MaterialColor white = MaterialColor(
    0xFFFFFFFF,
    <int, Color>{
      50: Color(0xFFFFFFFF),
      100: Color(0xFFfafafa),
      200: Color(0xFFf5f5f5),
      300: Color(0xFFf0f0f0),
      400: Color(0xFFdedede),
      500: Color(0xFFc2c2c2),
      600: Color(0xFF979797),
      700: Color(0xFF818181),
      800: Color(0xFF606060),
      900: Color(0xFF3c3c3c),
    },
  );

  static const MaterialColor primarySwatch = MaterialColor(
    _basePrimary,
    <int, Color>{
      50: Color(0xFFfef2ee),
      100: Color(0xFFfde4dc),
      200: Color(0xFFfcd7cb),
      300: Color(0xFFfbc9ba),
      400: Color(0xFFfbbca9),
      500: Color(0xFFfaaf97),
      600: Color(0xFFf9a186),
      700: Color(0xFFf89475),
      800: Color(0xFFf78663),
      900: Color(_basePrimary),
    },
  );
  static MaterialColor secondaryAccent = primarySwatch;

  static const Color secondary = Color(_basePrimary);
  static const MaterialColor primary = primarySwatch;
  static const Color primaryDark = Color(_basePrimary);
  static const Color lightPink = Color(0xFFF5F1F6);
  static const Color lightGrey = Color(0xFF656565);
  static const Color white50 = Color(0xFFF2F2F2);
  static const Color success = Color(0xFF7ED321);
  static const Color danger = Color(0xFFFF0505);
  static const Color info = Color(0xFF2D9CDB);
  static const Color warning = Color(0xFFF1B61E);
  static const Color gold = Color(0xFFD58929);
  static const Color green = Color(0xFF29BB89);
}
