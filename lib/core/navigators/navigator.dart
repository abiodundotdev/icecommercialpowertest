import 'package:flutter/material.dart';
import 'package:icecommercialpowertest/core/navigators/navigators.dart';

class AppNavigator {
  AppNavigator(GlobalKey<NavigatorState> navigatorKey)
      : store = StoreNavigator(navigatorKey),
        auth = AuthNavigator(navigatorKey);
  final StoreNavigator store;
  final AuthNavigator auth;
}
