import 'package:flutter/material.dart';
import 'package:readly/Theme/app_color.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColor.background,
    primaryColor: AppColor.primary,
    hintColor: AppColor.inactiveColor,
    fontFamily: "Inter",
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        fontSize: 30,
        color: AppColor.headLineTextColor,
        fontWeight: FontWeight.bold,
      ),
      bodySmall: TextStyle(fontSize: 18, color: AppColor.mediumTextColor),
    ),
    cardColor: AppColor.cardColor,
  );
}
