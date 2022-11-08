import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:icecommercialpowertest/core/core.dart';
import 'package:icecommercialpowertest/core/environment.dart';
import 'package:icecommercialpowertest/di.dart';
import 'package:icecommercialpowertest/domain/domain.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with AuthUseCases {
  late LoginRequestData loginRequestData;
  late GlobalKey<FormState> formKey;
  var _autoValidateMode = AutovalidateMode.disabled;
  @override
  void initState() {
    super.initState();
    loginRequestData = LoginRequestData();
    formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppBar(),
      body: Form(
        key: formKey,
        autovalidateMode: _autoValidateMode,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Gap(20.0.h),
                Image(
                  image: AppImages.logo,
                  width: 50.h,
                  height: 70.h,
                ),
                //  AppLogo(),
                Gap(10.0.h),
                Text(
                  "Log in",
                  style: AppFont.bold(
                    size: 22.sp,
                  ),
                ),
                Gap(10.0.h),
                TextFormField(
                  initialValue: !Env.mode.isProduction ? "mor_2314" : "",
                  validator: Validators.tryString(),
                  decoration: InputDecoration(
                    prefixIcon:
                        PrefixIconWidget(child: AppImages.messageIconImage),
                    hintText: "Username",
                  ),
                  onSaved: (val) => loginRequestData.username = val,
                ),
                Gap(10.0.h),
                TextFormField(
                  initialValue: !Env.mode.isProduction ? "83r5^_" : "",
                  obscureText: true,
                  onSaved: (val) => loginRequestData.password = val,
                  validator: Validators.tryString(),
                  decoration: InputDecoration(
                    prefixIcon:
                        PrefixIconWidget(child: AppImages.lockIconImage),
                    hintText: "Password",
                  ),
                ),
                Gap(10.0.h),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    child: Text(
                      "Forget password ?",
                      style: Theme.of(context).textTheme.subtitle2!,
                    ),
                    onPressed: () => print("object"),
                  ),
                ),
                ContainedButton(
                  text: "Log in",
                  onTap: handleSubmit,
                ),
                Gap(20.0.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PhysicalModel(
                      color: Colors.white,
                      elevation: 1.0,
                      shape: BoxShape.circle,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Image(image: AppImages.fblogo),
                      ),
                    ),
                    Gap(20.0.w),
                    PhysicalModel(
                      color: Colors.white,
                      elevation: 1.0,
                      shape: BoxShape.circle,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Image(image: AppImages.googlelogo),
                      ),
                    ),
                  ],
                ),
                Gap(30.0.h),
                Center(
                  child: Text.rich(
                    TextSpan(
                      text: "Don't have an account?  ",
                      children: [
                        TextSpan(
                          text: "Register",
                          style: const AppFont.bold().copyWith(
                            color: AppColors.primary,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              DI.get.navigator.auth.toSignUp();
                            },
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void handleSubmit() async {
    final form = formKey.currentState;
    if (form == null) {
      return;
    }
    if (!form.validate()) {
      _autoValidateMode = AutovalidateMode.always;
      return;
    }
    form.save();
    if (!loginRequestData.isValid) {
      return;
    }
    loginController(loginRequestData);
  }
}
