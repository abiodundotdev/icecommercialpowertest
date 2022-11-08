import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:icecommercialpowertest/core/core.dart';
import 'package:icecommercialpowertest/di.dart';
import 'package:icecommercialpowertest/domain/entities/models/models.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => DI.get.navigator.store.toProductDetails(product),
      child: Container(
        margin: EdgeInsets.only(left: 10.w),
        padding: const EdgeInsets.all(10.0),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0.w),
          ),
        ),
        constraints: BoxConstraints.tight(
          Size(150.0.h, 180.0.h),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: "producthero${product.id}",
              child: AppCachedNetworkImage(
                imageUrl: product.image,
                size: Size(99.0.h, 125.h),
              ),
            ),
            Gap(3.0.h),
            Text(
              product.title!.capitalize,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle2!.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
            ),
            Text(
              Money("${product.price!}").formatted,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle2!.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
            )
          ],
        ),
      ),
    );
  }
}
