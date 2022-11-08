import 'package:flutter/material.dart';
import 'package:icecommercialpowertest/core/navigators/navigators.dart';
import 'package:icecommercialpowertest/domain/entities/models/models.dart';
import 'package:icecommercialpowertest/presentation/store/my_cart_page.dart';
import 'package:icecommercialpowertest/presentation/store/product_details_page.dart';
import 'package:icecommercialpowertest/presentation/store/store.dart';

class StoreNavigator extends BaseNavigator {
  StoreNavigator(GlobalKey<NavigatorState> navigatorkey) : super(navigatorkey);
  void toProductDetails(ProductModel product) {
    push(ProductDetailsPage(product: product));
  }

  void toCarts() {
    push(const MyCartPage());
  }

  void toProfile() {
    push(ProfilePage());
  }
}
