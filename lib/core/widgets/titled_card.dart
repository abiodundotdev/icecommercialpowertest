import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:icecommercialpowertest/core/constants/app_colors.dart';

class TitledCard extends StatelessWidget {
  final String title;
  final String? extra;
  final Widget content;
  final Color? titleColor;
  final TextStyle? titleTextStyle;
  final TextStyle? extraTextStyle;
  final VoidCallback? onExtraPressed;
  const TitledCard({
    Key? key,
    required this.title,
    required this.content,
    this.extra,
    this.onExtraPressed,
    this.titleColor,
    this.titleTextStyle,
    this.extraTextStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: titleTextStyle ??
                  theme.subtitle2!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 20.0.sp,
                    color: titleColor ?? Colors.black,
                  ),
            ),
            if (extra != null && onExtraPressed != null)
              TextButton(
                onPressed: onExtraPressed,
                child: Text(
                  extra!,
                  style: extraTextStyle ??
                      theme.subtitle2!.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w400,
                      ),
                ),
              )
          ],
        ),
        Gap(10.0.h),
        content
      ],
    );
  }
}
