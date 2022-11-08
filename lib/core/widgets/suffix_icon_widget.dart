import 'package:flutter/material.dart';
import 'package:icecommercialpowertest/core/core.dart';

class PrefixIconWidget extends StatelessWidget {
  final ImageProvider child;
  const PrefixIconWidget({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: Theme.of(context).inputDecorationTheme.contentPadding!.subtract(
            const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          ),
      decoration: ShapeDecoration(
        color: AppColors.primary.shade100,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      child: ImageIcon(
        child,
        color: AppColors.primary,
        size: 25.0,
      ),
    );
  }
}
