import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:icecommercialpowertest/core/core.dart';

double _kBorderRadius = 100.0;

abstract class _AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final MaterialColor color;
  final BoxDecoration? decoration;
  final Widget? icon;
  final Color textColor;
  final double? height;
  final double? width;
  const _AppButton(
      {Key? key,
      required this.text,
      this.onTap,
      required this.color,
      this.decoration,
      this.height,
      this.width,
      this.textColor = AppColors.white,
      this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 0,
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Ink(
          width: width ?? double.maxFinite,
          height: height ?? 50.0.h,
          decoration: decoration ??
              BoxDecoration(
                color: onTap == null ? color.shade50 : color,
                borderRadius: BorderRadius.circular(_kBorderRadius.w),
              ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[icon!, Gap(5.0.w)],
              Text(
                text,
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: textColor,
                      fontWeight: FontWeight.w800,
                      fontSize: 16.0.sp,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ContainedButton extends _AppButton {
  ///Raised button with background color
  const ContainedButton(
      {required String text,
      MaterialColor color = AppColors.primarySwatch,
      Key? key,
      VoidCallback? onTap,
      BoxDecoration? decoration,
      double? height,
      double? width})
      : super(
          text: text,
          color: color,
          key: key,
          onTap: onTap,
          decoration: decoration,
          height: height,
          width: width,
        );

  ///Raised button with background color and an icon [Widget]
  const ContainedButton.icon({
    required String text,
    MaterialColor color = AppColors.primarySwatch,
    Key? key,
    required Widget icon,
    VoidCallback? onTap,
    double? height,
    double? width,
    BoxDecoration? decoration,
  }) : super(
          text: text,
          color: color,
          key: key,
          onTap: onTap,
          icon: icon,
          decoration: decoration,
          height: height,
          width: width,
        );
}

class GhostButton extends _AppButton {
  /// Outlined button with a colored border and white background color
  GhostButton({
    required String text,
    MaterialColor color = AppColors.primarySwatch,
    Key? key,
    Color? textColor,
    double? height,
    VoidCallback? onTap,
    Color? outlineColor,
    BoxDecoration? decoration,
  }) : super(
          text: text,
          color: color,
          key: key,
          onTap: onTap,
          decoration: decoration ??
              BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(5.0.w),
                border: Border.all(
                  color: outlineColor ?? Colors.red,
                ),
              ),
          height: height,
          textColor: textColor ?? AppColors.primary,
        );

  GhostButton.icon({
    required String text,
    MaterialColor color = AppColors.primarySwatch,
    Key? key,
    double? height,
    double? width,
    VoidCallback? onTap,
    required Widget icon,
    Color? outlineColor,
    BoxDecoration? decoration,
  }) : super(
            text: text,
            color: color,
            key: key,
            onTap: onTap,
            decoration: decoration ??
                BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(5.0.w),
                  border: Border.all(
                    color: outlineColor ?? Colors.red,
                  ),
                ),
            icon: icon,
            height: height,
            width: width,
            textColor: AppColors.primary);
}
