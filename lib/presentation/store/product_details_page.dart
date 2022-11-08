import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:icecommercialpowertest/core/core.dart';
import 'package:icecommercialpowertest/core/widgets/app_scaffold.dart';
import 'package:icecommercialpowertest/domain/domain.dart';

class ProductDetailsPage extends StatefulWidget {
  final ProductModel product;
  const ProductDetailsPage({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    final textTheme = Theme.of(context).textTheme;
    return AppScaffold(
      padding: EdgeInsets.zero,
      appBar: CustomAppBar(
        automaticallyImplyLeading: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Hero(
              tag: "producthero${widget.product.id}",
              child: AppCachedNetworkImage(
                imageUrl: product.image,
                size: Size(
                  MediaQuery.of(context).size.width,
                  200.h,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.all(20.0),
              decoration: const ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(45.0),
                    topRight: Radius.circular(45.0),
                  ),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(product.title ?? "N/A",
                            style: textTheme.headline5!.copyWith(
                              fontWeight: FontWeight.w700,
                            )),
                        flex: 3,
                      ),
                      Gap(10.0.h),
                      Text(
                        Money("${product.price}").formatted,
                        style: textTheme.headline6!.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  Gap(20.0.h),
                  Text(
                    product.description ?? "N/A",
                    style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                      height: 1.3,
                    ),
                  ),
                  const Spacer(),
                  ContainedButton(
                    text: "Add to cart",
                    onTap: () => print("ADDE"),
                  ),
                  Gap(20.0.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
