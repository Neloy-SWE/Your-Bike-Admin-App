import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:your_bike_admin/utilities/app_strings.dart';

/// Created by Neloy on 3/16/2024
/// Email: taufiqneloy.swe@gmail.com


class AppTheme {
  static final get = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
      color: Colors.white,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      titleTextStyle: TextStyle(
        fontFamily: AppStrings.fontBold,
        color: Colors.black,
        fontSize: 20,
      ),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        fontFamily: AppStrings.fontRegular,
        color: Colors.black,
        fontSize: 25,
      ),

      titleMedium: TextStyle(
        fontFamily: AppStrings.fontBold,
        color: Colors.black,
        fontSize: 15,
      ),
      bodyMedium: TextStyle(
        fontFamily: AppStrings.fontRegular,
        color: Colors.black,
        fontSize: 13,
      ),
      bodySmall: TextStyle(
        fontFamily: AppStrings.fontRegular,
        color: Colors.black26,
        fontSize: 13,
      ),
      titleSmall: TextStyle(
        fontFamily: AppStrings.fontBold,
        color: Colors.red,
        fontSize: 11,
      ),
      titleLarge: TextStyle(
        fontFamily: AppStrings.fontBold,
        color: Colors.white,
        fontSize: 13,
      ),
      displayLarge: TextStyle(
        fontFamily: AppStrings.fontBold,
        color: Colors.black,
        fontSize: 20,
      ),
    ),
  );
}