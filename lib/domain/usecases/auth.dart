import 'package:flutter/material.dart';
import 'package:icecommercialpowertest/app_logger.dart';
import 'package:icecommercialpowertest/core/core.dart';
import 'package:icecommercialpowertest/di.dart';
import 'package:icecommercialpowertest/domain/domain.dart';
import 'package:icecommercialpowertest/presentation/store/bloc/dashboard_bloc.dart';
import 'package:icecommercialpowertest/presentation/store/cartbloc/cart_bloc.dart';

mixin AuthUseCases {
  BuildContext get context;
  final repository = DI.get.repository;
  Future<bool> loginController(LoginRequestData loginRequestData) async {
    AppPreloader.show(context);
    try {
      // This is commented out becauce login endpoint returns error
      //final reponse = await repository.auth.login(loginRequestData);
      await Future.delayed(Duration(seconds: 3));
      DashboardBloc.fetch(context);
      CartBloc.fetch(context);
      //AppLogger().info(reponse);
      AppSnackbar.success(context, "Login Successful");
      DI.get.navigator.auth.toDashBoard();
      return true;
    } catch (e) {
      AppSnackbar.error(context, AppStrings.sww);
      return false;
    } finally {
      AppPreloader.hide(context);
    }
  }

  Future<bool> signUpController(SignUpRequestData signUpRequestData) async {
    AppPreloader.show(context);
    try {
      // This is commented out becauce login endpoint returns error
      //final reponse = await repository.auth.login(loginRequestData);
      await Future.delayed(Duration(seconds: 3));
      DashboardBloc.fetch(context);
      CartBloc.fetch(context);
      //AppLogger().info(reponse);
      AppSnackbar.success(context, "Sign Up Successful");
      DI.get.navigator.auth.toLogin();
      return true;
    } catch (e) {
      AppSnackbar.error(context, AppStrings.sww);
      return false;
    } finally {
      AppPreloader.hide(context);
    }
  }
}
