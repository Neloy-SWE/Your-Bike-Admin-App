import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:your_bike_admin/network/helper/helper_login.dart';
import 'package:your_bike_admin/screens/screen_all_bike_list.dart';
import 'package:your_bike_admin/utilities/app_size.dart';

import '../components/custom_dialogue.dart';
import '../components/custom_text_field.dart';
import '../network/manager/manager_login.dart';
import '../utilities/app_image_path.dart';
import '../utilities/app_strings.dart';

/// Created by Neloy on 3/21/2024
/// Email: taufiqneloy.swe@gmail.com

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> implements LoginManager {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _loginKey = GlobalKey<FormState>();

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return await CustomDialogue.decision(
          context: context,
          onPressed: () {
            SystemNavigator.pop();
          },
          icon: Icons.dangerous_outlined,
          message: AppStrings.doYouWantToExitApp,
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.login),
        ),
        body: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(25),
          children: [
            AppSize.gapH40,
            Image.asset(
              AppImagePath.bike,
              height: 100,
            ),
            AppSize.gapH80,

            // login form
            Form(
              key: _loginKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // phone
                  CustomTextField.get(
                    context: context,
                    controller: phoneController,
                    textInputType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                    label: AppStrings.phone,
                    hint: AppStrings.phoneHint,
                    inputFormatters: [LengthLimitingTextInputFormatter(11)],
                    validatorFunction: (value) {
                      if (value!.isEmpty) {
                        return AppStrings.emptyField;
                      } else if (!value.startsWith("01") ||
                          value.length != 11) {
                        return AppStrings.invalidPhone;
                      } else {
                        return null;
                      }
                    },
                  ),
                  AppSize.gapH20,

                  // password
                  CustomTextField.get(
                    context: context,
                    controller: passwordController,
                    textInputType: TextInputType.visiblePassword,
                    secure: true,
                    textInputAction: TextInputAction.done,
                    label: AppStrings.password,
                    hint: AppStrings.passwordHint,
                    validatorFunction: (value) {
                      if (value!.isEmpty) {
                        return AppStrings.emptyField;
                      } else {
                        return null;
                      }
                    },
                  ),
                  AppSize.gapH40,
                ],
              ),
            ),

            // login in button
            MaterialButton(
              elevation: 0,
              height: 50,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  10,
                ),
              ),
              onPressed: () {
                if (_loginKey.currentState!.validate()) {
                  login(context: context);
                }
                // LoginAPI().call();

                // Navigator.of(context).pushReplacement(
                //   MaterialPageRoute(
                //     builder: (builder) => const HomePage(),
                //   ),
                // );
                // CustomDialogue.simple(context: context, icon: Icons.verified_outlined, message: AppStrings.update, buttonText: AppStrings.done);
                // CustomDialogue.simple(context: context, icon: Icons.error_outline_outlined, message: AppStrings.checkYourInternet, buttonText: AppStrings.goBack);
                // CustomDialogue.functional(
                //   context: context,
                //   onPressed: () {},
                //   icon: Icons.logout,
                //   message: AppStrings.doYouWantToExitApp,
                // );
                // CustomDialogue.functional(
                //   context: context,
                //   onPressed: () {},
                //   icon: Icons.delete,
                //   message: AppStrings.doYouWantToDelete,
                // );
              },
              color: Colors.black,
              child: Text(
                AppStrings.login,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> login({required BuildContext context}) async {
    CustomDialogue.loading(context: context);
    await LoginHelper().connection(
      phone: phoneController.text.trim(),
      password: passwordController.text.trim(),
      manager: this,
    );
  }

  @override
  void fail({required String message}) {
    Navigator.of(context).pop();
    Timer(
      const Duration(seconds: 1),
      () {
        CustomDialogue.simple(
          context: context,
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icons.error_outline_outlined,
          message: message,
          buttonText: AppStrings.close,
        );
      },
    );
  }

  @override
  void success({required String message}) {
    Navigator.of(context).pop();
    Timer(
      const Duration(seconds: 1),
      () {
        CustomDialogue.simple(
          context: context,
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (builder) => const AllBikeList(),
              ),
              (Route<dynamic> route) => false,
            );
          },
          icon: Icons.verified_outlined,
          message: message,
          buttonText: AppStrings.done,
        );
      },
    );
  }
}
