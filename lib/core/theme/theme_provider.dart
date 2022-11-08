import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icecommercialpowertest/core/constants/constants.dart';
import 'package:icecommercialpowertest/core/theme/app_font.dart';

const double kButtonHeight = 66.0;

class ThemeProvider extends InheritedTheme {
  Color hintColor = Color(0xFFAAAAAA);
  Color borderSideColor = Color(0x66D1D1D1);
  Color borderSideErrorColor = Colors.red..shade900;
  Color textBaseColor = Color(0xFFA9A9A9);

  final Widget child;

  ThemeProvider({Key? key, required this.child})
      : super(key: key, child: child);

  ThemeData themeData(ThemeData theme) {
    final textFieldBorder = OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(10),
    );
    final focusTextFieldBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.primary,
      ),
      borderRadius: BorderRadius.circular(12),
    );

    return ThemeData(
      scaffoldBackgroundColor: Colors.white60,
      primarySwatch: AppColors.primarySwatch,
      primaryColor: AppColors.primary,
      primaryIconTheme:
          theme.primaryIconTheme.copyWith(color: AppColors.primarySwatch),
      textTheme: theme.textTheme
          .copyWith(
            button: theme.textTheme.button!.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
          )
          .apply(
            bodyColor: kTextBaseColor,
            displayColor: kTextBaseColor,
            fontFamily: AppStrings.fontName,
          ),
      iconTheme: theme.iconTheme.copyWith(
        size: 20,
        color: AppColors.primary,
      ),
      appBarTheme: theme.appBarTheme.copyWith(
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.w800,
          color: Colors.black,
          fontSize: 14.0.sp,
        ),
        color: Colors.black,
      ),
      canvasColor: Colors.white,
      colorScheme: theme.colorScheme.copyWith(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
      ),
      shadowColor: Colors.grey.shade400,
      buttonTheme: theme.buttonTheme.copyWith(
        height: 66.0,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: AppColors.primary,
          accentColor: AppColors.secondaryAccent,
        ),
        shape: const RoundedRectangleBorder(),
        highlightColor: Colors.white10,
        splashColor: AppColors.primary.shade100,
        textTheme: ButtonTextTheme.primary,
      ),
      inputDecorationTheme: InputDecorationTheme(
        iconColor: AppColors.primary,
        border: textFieldBorder,
        focusColor: AppColors.primary,
        suffixIconColor: AppColors.primary,
        hoverColor: AppColors.primary,
        focusedBorder: focusTextFieldBorder,
        prefixIconColor: AppColors.primary,
        enabledBorder: textFieldBorder,
        errorBorder: textFieldBorder.copyWith(
          borderSide: BorderSide(color: borderSideErrorColor, width: 1.0),
        ),
        hintStyle: const AppFont.regular(
          color: Colors.grey,
        ),
        labelStyle: const AppFont.regular(),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 26,
        ),
        fillColor: Colors.white,
        filled: true,
      ),
      textSelectionTheme: theme.textSelectionTheme.copyWith(
        cursorColor: AppColors.primary,
        selectionColor: AppColors.primary,
        selectionHandleColor: AppColors.primary,
      ),
      fontFamily: AppStrings.fontName,
      hintColor: hintColor,
      disabledColor: hintColor,
      dividerColor: Colors.black,
    );
  }

  static ThemeProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ThemeProvider>();
  }

  @override
  bool updateShouldNotify(ThemeProvider oldWidget) {
    return true;
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return ThemeProvider(child: child);
  }
}
