import 'package:flutter/material.dart';

const Color kHintColor = Color(0xFFAAAAAA);
const Color kBorderSideColor = Color(0x66D1D1D1);
//final Color kBorderSideErrorColor = AppColors.secondaryAccent.shade900;
const Color kTextBaseColor = Color(0xFF000000);

//const double kButtonHeight = 66.0;

class AppBorderSide extends BorderSide {
  const AppBorderSide({Color? color, BorderStyle? style, double? width})
      : super(
          color: color ?? kBorderSideColor,
          style: style ?? BorderStyle.solid,
          width: width ?? 1.0,
        );
}

class AppTextStyle extends TextStyle {
  const AppTextStyle({double? fontSize, FontWeight? fontWeight, Color? color})
      : super(
          //inherit: true,
          color: color ?? kTextBaseColor,
          fontSize: fontSize,
          fontWeight: fontWeight ?? AppTextStyle.regular,
          textBaseline: TextBaseline.alphabetic,
        );

  static const FontWeight thin = FontWeight.w200;
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semibold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight black = FontWeight.w900;
}

class AppFont extends AppTextStyle {
  const AppFont.size(double size) : super(fontSize: size);

  const AppFont.thin({double size = 14.0, Color? color})
      : super(fontSize: size, fontWeight: AppTextStyle.thin, color: color);

  const AppFont.light({double size = 14.0, Color? color})
      : super(fontSize: size, fontWeight: AppTextStyle.light, color: color);

  const AppFont.regular({double size = 14.0, Color? color})
      : super(fontSize: size, color: color, fontWeight: AppTextStyle.regular);

  const AppFont.medium({double size = 14.0, Color? color})
      : super(fontSize: size, fontWeight: AppTextStyle.medium, color: color);

  const AppFont.semibold({double size = 14.0, Color? color})
      : super(fontSize: size, fontWeight: AppTextStyle.semibold, color: color);

  const AppFont.bold({double size = 14.0, Color? color})
      : super(fontSize: size, fontWeight: AppTextStyle.bold, color: color);
}
