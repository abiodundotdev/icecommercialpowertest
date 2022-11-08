import 'package:flutter/material.dart';
import 'package:icecommercialpowertest/core/route_transition.dart';

class BaseNavigator {
  final GlobalKey<NavigatorState> navigatorkey;
  BaseNavigator(this.navigatorkey);
  Future<dynamic> push(Widget widget) async {
    return navigatorkey.currentState?.push(
      RouteTransition.slideIn(widget),
    );
  }

  Future<dynamic> pushFadeIn(Widget widget) async {
    return navigatorkey.currentState?.push(
      RouteTransition.fadeIn(widget),
    );
  }

  void pushAndRemoveAllExceptThis(Widget widget) {
    navigatorkey.currentState?.pushAndRemoveUntil(
      RouteTransition.slideIn(widget),
      ((route) => false),
    );
  }
}
