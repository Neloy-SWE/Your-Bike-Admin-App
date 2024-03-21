import 'package:flutter/material.dart';

import '../utilities/app_strings.dart';

/// Created by Neloy on 3/21/2024
/// Email: taufiqneloy.swe@gmail.com


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.login),
      ),
    );
  }
}
