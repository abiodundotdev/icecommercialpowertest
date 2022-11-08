import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:icecommercialpowertest/core/constants/constants.dart';
import 'package:icecommercialpowertest/di.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _handleComplete();
  }

  void _handleComplete() async {
    await Future.delayed(Duration(seconds: 3));
    DI.get.navigator.auth.toLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Image(
                image: AppImages.logo,
              ),
            ),
            Gap(200.0.h),
            const CircularProgressIndicator(),
            Gap(10.0.h),
          ],
        ),
      ),
    );
  }
}
