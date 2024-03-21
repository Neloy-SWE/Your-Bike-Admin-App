import 'package:flutter/material.dart';
import 'package:your_bike_admin/utilities/app_size.dart';

import '../components/custom_text_field.dart';
import '../utilities/app_image_path.dart';
import '../utilities/app_strings.dart';

/// Created by Neloy on 3/21/2024
/// Email: taufiqneloy.swe@gmail.com

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

          // email
          CustomTextField.get(
            context: context,
            controller: emailController,
            textInputType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            label: AppStrings.email,
            hint: "bike",
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
            hint: "bike",
          ),
          AppSize.gapH40,

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
    );
  }
}