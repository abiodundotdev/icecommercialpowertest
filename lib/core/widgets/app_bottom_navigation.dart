import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:icecommercialpowertest/core/core.dart';

class AppBottomNavigationBar extends StatefulWidget {
  final List<CustomButtomNavigationBarItem> items;
  AppBottomNavigationBar({Key? key, required this.items})
      : assert(items.isNotEmpty),
        super(key: key);

  @override
  State<AppBottomNavigationBar> createState() => _AppBottomNavigationBarState();
}

class _AppBottomNavigationBarState extends State<AppBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Ink(
        decoration: const ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          shadows: [
            BoxShadow(
                offset: Offset(0, 0), color: Colors.white30, blurRadius: 5.0),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            for (var i = 0; i < widget.items.length; i++) widget.items[i]
          ],
        ),
      ),
    );
  }
}

class CustomButtomNavigationBarItem extends StatelessWidget {
  final IconData icon;
  final IconData activeIcon;
  final String label;
  final bool isActive;
  final int index;
  final VoidCallback? onTap;
  const CustomButtomNavigationBarItem({
    Key? key,
    required this.isActive,
    required this.activeIcon,
    required this.icon,
    required this.index,
    required this.label,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: onTap,
      child: AnimatedSwitcher(
        key: Key("value$index"),
        duration: const Duration(milliseconds: 500),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (isActive)
              Container(
                height: 10.0,
                width: 20.0,
                decoration: const BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    )),
              ),
            Gap(5.0.h),
            Icon(
              isActive ? activeIcon : icon,
              size: BottomNavigationBarTheme.of(context)
                      .selectedIconTheme
                      ?.size ??
                  24.0,
              color: isActive ? AppColors.primary : AppColors.lightGrey,
            ),
            Gap(10.0.h),
            Text(
              label,
              style: theme.caption!.copyWith(
                fontSize: 10.0.sp,
                color: isActive ? AppColors.primary : AppColors.lightGrey,
                fontWeight: FontWeight.w900,
              ),
            )
          ],
        ),
      ),
    );
  }
}
