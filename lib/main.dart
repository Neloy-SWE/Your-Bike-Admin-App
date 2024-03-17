import 'package:flutter/material.dart';
import 'package:your_bike_admin/components/theme/app_theme.dart';
import 'package:your_bike_admin/screens/screen_splash.dart';
import 'package:your_bike_admin/utilities/app_strings.dart';

/// Created by Neloy on 3/16/2024
/// Email: taufiqneloy.swe@gmail.com

void main(){
runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.get,
        title: AppStrings.appTitle,
        home: const SplashScreen(),
      ),
    );
  }
}


