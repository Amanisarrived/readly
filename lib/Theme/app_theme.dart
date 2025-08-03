import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readly/Theme/app_color.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColor.background,
    primaryColor: AppColor.primary,
    hintColor: AppColor.inactiveColor,
    fontFamily: "Inter",
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        fontSize: 30.sp,
        color: AppColor.headLineTextColor,
        fontWeight: FontWeight.bold,
      ),
      bodySmall: TextStyle(fontSize: 18.sp, color: AppColor.mediumTextColor),
    ),
    cardColor: AppColor.cardColor,
  );
}
