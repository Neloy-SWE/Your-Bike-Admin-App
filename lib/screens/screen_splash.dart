import 'dart:async';

import 'package:flutter/material.dart';
import 'package:your_bike_admin/screens/screen_home_page.dart';
import 'package:your_bike_admin/utilities/app_image_path.dart';
import 'package:your_bike_admin/utilities/app_size.dart';
import 'package:your_bike_admin/utilities/app_strings.dart';

import '../components/custom_loader.dart';

/// Created by Neloy on 3/16/2024
/// Email: taufiqneloy.swe@gmail.com

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (builder) => const HomePage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.welcome),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                AppImagePath.bike,
                height: 200,
              ),
              Column(
                children: [
                  Text(
                    AppStrings.yourBikeAdminApp,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  AppSize.gapH40,
                  const MyLoader(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
