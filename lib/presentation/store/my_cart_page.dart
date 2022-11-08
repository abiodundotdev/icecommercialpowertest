import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:icecommercialpowertest/core/core.dart';
import 'package:icecommercialpowertest/di.dart';
import 'package:icecommercialpowertest/domain/domain.dart';
import 'package:icecommercialpowertest/presentation/store/cartbloc/cart_bloc.dart';
import 'package:icecommercialpowertest/presentation/store/widget/dashboard_state_builder.dart';

class MyCartPage extends StatefulWidget {
  const MyCartPage({Key? key}) : super(key: key);

  @override
  State<MyCartPage> createState() => _MyCartPageState();
}

class _MyCartPageState extends State<MyCartPage> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppBar(
        automaticallyImplyLeading: true,
        title: "My Cart",
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () => const Center(
                child: CircularProgressIndicator(),
              ),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              error: (message) => Center(
                child: Text(message),
              ),
              completed: (cartdata) {
                return DashboardStateBuilder(builder: (dashboardData) {
                  final productsInStores = dashboardData.products;
                  final cart = cartdata.first;
                  return Column(
                    children: List.generate(cart.products!.length, (index) {
                      final cartProducts = cart.products ?? [];
                      final product = productsInStores!.firstWhere(
                          (ed) => ed.id == cartProducts[index].productId);
                      return CartProductCard(
                        product: product,
                        cartProduct: cartProducts[index],
                      );
                    }),
                  );
                });
              },
            );
          },
        ),
      ),
    );
  }
}

class CartProductCard extends StatefulWidget {
  final CartProductModel cartProduct;
  final ProductModel product;
  const CartProductCard(
      {Key? key, required this.product, required this.cartProduct})
      : super(key: key);

  @override
  State<CartProductCard> createState() => _CartProductCardState();
}

class _CartProductCardState extends State<CartProductCard> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    final cartProduct = widget.cartProduct;
    final theme = Theme.of(context).textTheme;
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(5.0.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                child: Center(
                  child: AppCachedNetworkImage(
                    imageUrl: product.image,
                    size: const Size.square((80)),
                  ),
                ),
              ),
              Gap(10.0.w),
              Expanded(
                flex: 4,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(8.0.h),
                    Text(
                      product.title!,
                      maxLines: 1,
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                      style: theme.subtitle1!.copyWith(
                        color: Colors.grey,
                        fontWeight: FontWeight.w800,
                        fontSize: 10.0.sp,
                      ),
                    ),
                    Gap(10.0.h),
                    Text(
                      Money(product.price.toString()).formatted,
                      style: theme.subtitle2!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontSize: 14.0.sp,
                      ),
                    ),
                    Gap(5.0.h),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    key: const Key("add_remove"),
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () =>
                            _handleUpdateCart(product.id!, CartUpdateType.add),
                        child: Container(
                          padding: const EdgeInsets.all(5.0),
                          decoration: ShapeDecoration(
                            color: AppColors.primary.shade50,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          child: Icon(
                            AppIcons.addSquare,
                            size: 15.0,
                          ),
                        ),
                      ),
                      Gap(5.0.w),
                      Text(
                        cartProduct.quantity.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2!
                            .copyWith(color: Colors.black),
                      ),
                      Gap(5.0.w),
                      InkWell(
                        onTap: () => _handleUpdateCart(
                            product.id!, CartUpdateType.minus),
                        child: Container(
                          padding: const EdgeInsets.all(5.0),
                          decoration: ShapeDecoration(
                            color: AppColors.primary.shade50,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          child: Icon(
                            AppIcons.minusSquare,
                            size: 15.0,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
        Gap(10.0.h)
      ],
    );
  }

  void _handleUpdateCart(int cartId, CartUpdateType type) async {
    try {
      final res = await DI.get.repository;
    } catch (e) {}
  }
}

enum CartUpdateType { add, minus, remove }

 // IconButton(
              //   padding: EdgeInsets.zero,
              //   onPressed: () => handleUpdateCart(
              //     widget.cart.id,
              //     CartUpdateType.remove,
              //   ),
              //   icon: const Icon(
              //     .trash4,
              //     color: Colors.black,
              //   ),
              // ),