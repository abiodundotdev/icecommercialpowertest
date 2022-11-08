import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class InfoRow extends StatelessWidget {
  final String title;
  final String value;
  const InfoRow({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(
        title,
        style: textTheme.subtitle2!.copyWith(
          color: Colors.grey.shade700,
        ),
      ),
      Text(
        value,
        style: textTheme.subtitle2!
            .copyWith(color: Colors.black, fontWeight: FontWeight.w900),
      )
    ]);
  }
}

class InfoColumn extends StatelessWidget {
  final String title;
  final String value;
  final Color? valueColor;
  const InfoColumn(
      {Key? key, required this.title, required this.value, this.valueColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: textTheme.subtitle2!.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        Gap(3.0.h),
        Text(
          value,
          style: textTheme.subtitle2!.copyWith(
            color: valueColor ?? Colors.grey.shade500,
            fontSize: 10.0.sp,
          ),
        ),
      ],
    );
  }
}
