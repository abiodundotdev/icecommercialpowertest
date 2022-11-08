import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:icecommercialpowertest/core/core.dart';
import 'package:shimmer/shimmer.dart';

class RowBoxLoading extends StatelessWidget {
  final int itemCount;
  final Size? itemSize;
  const RowBoxLoading({Key? key, required this.itemCount, this.itemSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var i = 0; i < itemCount; i++) ...[
          buildBoxShimmer(),
          Gap(10.0.w),
        ],
      ],
    );
  }

  Widget buildBoxShimmer() {
    return Shimmer.fromColors(
      child: Card(
        elevation: 1.0,
        child: SizedBox.fromSize(
          size: itemSize ?? Size.square(60.0.h),
        ),
      ),
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
    );
  }
}

class ColumnBoxLoading extends StatelessWidget {
  final int itemCount;
  final Size? itemSize;
  const ColumnBoxLoading({Key? key, required this.itemCount, this.itemSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var i = 0; i < itemCount; i++) ...[
          buildBoxShimmer(),
          Gap(8.0.w),
        ],
      ],
    );
  }

  Widget buildBoxShimmer() {
    return Shimmer.fromColors(
      loop: 500,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Card(
          elevation: 1.0,
          child: SizedBox.fromSize(
            size: itemSize ?? Size(double.maxFinite, 80.0.h),
          ),
        ),
      ),
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
    );
  }
}

class ProductLoading extends StatelessWidget {
  final int itemCount;
  final Size? itemSize;
  const ProductLoading({Key? key, required this.itemCount, this.itemSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppGridLayout(
      items: [
        for (var i = 0; i < itemCount; i++) ...[
          buildBoxShimmer(),
        ],
      ],
    );
  }

  Widget buildBoxShimmer() {
    return Shimmer.fromColors(
      child: Card(
        elevation: 1.0,
        child: SizedBox.fromSize(
          size: itemSize ?? Size(30.w, 100.0.h),
        ),
      ),
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
    );
  }
}

class ImageLoadingIndicator extends StatelessWidget {
  final Size? itemSize;
  const ImageLoadingIndicator({Key? key, this.itemSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      child: Card(
        elevation: 1.0,
        child: SizedBox.fromSize(
          size: itemSize ?? Size(30.w, 100.0.h),
        ),
      ),
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
    );
  }
}
