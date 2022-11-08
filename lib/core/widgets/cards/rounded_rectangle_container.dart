import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icecommercialpowertest/core/constants/constants.dart';

class RoundedRectangleContainer extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget child;
  final EdgeInsets? padding;
  const RoundedRectangleContainer(
      {Key? key, this.onTap, required this.child, this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double borderRadius = 8.0.w;
    return InkWell(
      onTap: onTap,
      child: Ink(
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.dark.shade500),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(borderRadius),
              topRight: Radius.circular(borderRadius),
              bottomRight: Radius.circular(borderRadius),
            )),
        padding: padding ?? EdgeInsets.all(15.0.w),
        child: child,
      ),
    );
  }
}
