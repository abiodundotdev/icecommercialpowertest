import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppProductList extends StatelessWidget {
  final List<Widget> items;
  const AppProductList({Key? key, required this.items}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180.h,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          for (var i = 0; i < items.length; i++) items[i],
        ],
      ),
    );
  }
}

class AppListLayout extends StatelessWidget {
  final List<Widget> items;
  const AppListLayout({Key? key, required this.items}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        for (var i = 0; i < items.length; i++) items[i],
      ],
    );
  }
}

class AppGridLayout extends StatelessWidget {
  final List<Widget> items;
  final double? childAspectRatio;
  const AppGridLayout({Key? key, required this.items, this.childAspectRatio})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 10.0.h,
      crossAxisSpacing: 10.0.w,
      childAspectRatio: childAspectRatio ?? 9 / 13,
      children: [for (var i = 0; i < items.length; i++) items[i]],
    );
  }
}
