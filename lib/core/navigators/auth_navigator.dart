import 'package:flutter/material.dart';
import 'package:icecommercialpowertest/core/navigators/navigators.dart';
import 'package:icecommercialpowertest/presentation/presentation.dart';

class AuthNavigator extends BaseNavigator {
  AuthNavigator(GlobalKey<NavigatorState> navigatorkey) : super(navigatorkey);
  void toLogin() {
    pushAndRemoveAllExceptThis(const LoginPage());
  }

  void toSignUp() {
    push(const SignUpPage());
  }

  void toDashBoard() {
    pushAndRemoveAllExceptThis(DashboadPage());
  }

  void toForgetPassword() {
    ///push(ForgetPasswordPage());
  }

  void toChangePassword(String email) {
    //push(ChangePasswordPage(email: email));
  }
  void toSuccessfulPassword() {
    //push(const FogetPasswordSuccessfulPage());
  }
  void toOnBoarding() {
    //pushAndRemoveAllExceptThis(const OnBoardingPage());
  }
  void toChangePasswordProfile() {}
  void toCodeConfirmation(String email, type) {
    //push(CodeConfirmationPage(type: type, email: email));
  }

  void toEditProfile() {}
}
