import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:icecommercialpowertest/core/core.dart';
import 'dart:ui' as ui;

class CustomPreloader extends StatefulWidget {
  const CustomPreloader({Key? key}) : super(key: key);

  @override
  State<CustomPreloader> createState() => _CustomPreloaderState();
}

class _CustomPreloaderState extends State<CustomPreloader>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
      lowerBound: 0,
      upperBound: Angle(360.0).toRadians,
    );
    controller.repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: controller,
        builder: (context, _) {
          return SafeArea(
            child: BackdropFilter(
              filter: ui.ImageFilter.blur(
                sigmaX: 3.0,
                sigmaY: 3.0,
              ),
              child: Material(
                color: Colors.transparent,
                child: AbsorbPointer(
                  absorbing: true,
                  child: Container(
                    alignment: Alignment.topCenter,
                    height: 100.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const CircularProgressIndicator(
                          strokeWidth: 5.0,
                        ),
                        Gap(20.0.h),
                        const Text(
                          "Loading please wait",
                          style: AppFont.bold(),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}

class _PreloaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final pathBound =
        Rect.fromCenter(center: center, width: size.width, height: size.width);
    Paint paint = Paint()
      // ..color = AppColors.primary
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..shader = ui.Gradient.linear(
        Offset.zero,
        Offset(size.width / 2, size.height / 2),
        [
          AppColors.green,
          AppColors.primary,
        ],
      )
      ..strokeWidth = 10;

    canvas.drawArc(pathBound, 0, Angle(270.0).toRadians, false, paint);
  }

  @override
  bool shouldRepaint(_PreloaderPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(_PreloaderPainter oldDelegate) => false;
}
