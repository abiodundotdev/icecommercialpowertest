import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class LabeledForm extends StatelessWidget {
  final String label;
  final Widget child;
  const LabeledForm({Key? key, required this.label, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Theme.of(context)
                .textTheme
                .bodyText2!
                .copyWith(fontSize: 11.0, fontWeight: FontWeight.w500),
          ),
          Gap(5.0.h),
          child
        ],
      ),
    );
  }
}
