import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:icecommercialpowertest/core/core.dart';
import 'package:icecommercialpowertest/di.dart';
import 'package:icecommercialpowertest/domain/domain.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> with AuthUseCases {
  late SignUpRequestData signUpRequestData;
  late GlobalKey<FormState> formKey;
  var _autoValidateMode = AutovalidateMode.disabled;
  @override
  void initState() {
    super.initState();
    signUpRequestData = SignUpRequestData();
    formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Form(
          autovalidateMode: _autoValidateMode,
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                image: AppImages.logo,
                width: 50.h,
                height: 70.h,
              ),
              Gap(10.0.h),
              Text(
                "Sign Up",
                style: AppFont.medium(
                  size: 22.sp,
                ),
              ),
              Gap(10.0.h),
              TextFormField(
                validator: Validators.tryString(),
                decoration: InputDecoration(
                  prefixIcon:
                      PrefixIconWidget(child: AppImages.profileIconImage),
                  hintText: "First name",
                ),
                onSaved: (val) => signUpRequestData.firstname = val,
              ),
              Gap(10.0.h),
              TextFormField(
                validator: Validators.tryString(),
                decoration: InputDecoration(
                  prefixIcon:
                      PrefixIconWidget(child: AppImages.profileIconImage),
                  hintText: "Last name",
                ),
                onSaved: (val) => signUpRequestData.lastname = val,
              ),
              Gap(10.0.h),
              TextFormField(
                validator: Validators.tryString(),
                decoration: InputDecoration(
                  prefixIcon:
                      PrefixIconWidget(child: AppImages.profileIconImage),
                  hintText: "Username",
                ),
                onSaved: (val) => signUpRequestData.username = val,
              ),
              Gap(10.0.h),
              Gap(10.0.h),
              TextFormField(
                validator: Validators.tryString(),
                decoration: InputDecoration(
                  prefixIcon: PrefixIconWidget(child: AppImages.lockIconImage),
                  hintText: "Password",
                ),
                onSaved: (val) => signUpRequestData.password = val,
              ),
              Gap(10.0.h),
              Align(
                alignment: Alignment.centerLeft,
                child: CheckboxListTile(
                  value: true,
                  onChanged: (bool? val) => print(val),
                  title: Text.rich(
                    TextSpan(
                      text: "I accept all the  ",
                      children: [
                        TextSpan(
                          text: "Terms and conditions",
                          style: const AppFont.bold().copyWith(
                            color: AppColors.primary,
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () {},
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: Colors.grey,
                        ),
                  ),
                ),
              ),
              ContainedButton(
                text: "Sign up",
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
                      child: Image(image: AppImages.googlelogo),
                    ),
                  ),
                  Gap(20.0.w),
                  PhysicalModel(
                    color: Colors.white,
                    elevation: 1.0,
                    shape: BoxShape.circle,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Image(image: AppImages.fblogo),
                    ),
                  ),
                ],
              ),
              Gap(30.0.h),
              Center(
                child: Text.rich(
                  TextSpan(
                    text: "Already have an account?   ",
                    children: [
                      TextSpan(
                        text: "Login",
                        style: const AppFont.bold().copyWith(
                          color: AppColors.primary,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            DI.get.navigator.auth.toLogin();
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
    if (!signUpRequestData.isValid) {
      print("nuuu");
      return;
    }
    signUpController(signUpRequestData);
  }
}
