import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:icecommercialpowertest/core/core.dart';
import 'package:icecommercialpowertest/di.dart';

class CategoryCard extends StatelessWidget {
  final String name;
  const CategoryCard({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => DI.get.navigator,
      child: Container(
        margin: EdgeInsets.only(left: 10.w),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0.w),
          ),
        ),
        constraints: BoxConstraints.tight(
          Size.square(70.0.h),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage("assets/images/${name.toLowerCase()}.png"),
              width: 27.0.h,
              height: 38.0.h,
            ),
            Gap(3.0.h),
            Text(
              name.capitalize,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle2!.copyWith(
                    fontSize: 10.0.sp,
                    fontWeight: FontWeight.w900,
                  ),
            )
          ],
        ),
      ),
    );
  }
}
