import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/core/config/colors.dart';

class Themes {
  static const fontFamily = 'Montserrat';

  static ThemeData getLightTheme() => ThemeData(
      scaffoldBackgroundColor: AppColors.lightBd,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.mainColor,
      ).copyWith(
        primary: AppColors.mainColor,
        brightness: Brightness.light,
        secondary: AppColors.secColor,
      ),
      appBarTheme: AppBarTheme(
        elevation: 2.h,
        toolbarHeight: 60.h,
        backgroundColor: AppColors.lightBd,
        iconTheme: IconThemeData(
          color: AppColors.mainColor,
          size: 30.h,
        ),
      ),
      useMaterial3: true,
      textTheme: TextTheme(
        displayLarge: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontFamily: fontFamily,
            fontSize: 28.sp),
        displayMedium: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontFamily: fontFamily,
            fontSize: 22.sp),
        displaySmall: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontFamily: fontFamily,
            fontSize: 16.sp),
        bodyLarge: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontFamily: fontFamily,
            fontSize: 18.sp),
        bodyMedium: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontFamily: fontFamily,
            fontSize: 13.sp),
        bodySmall: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontFamily: fontFamily,
            fontSize: 8.sp),
        headlineLarge: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: fontFamily,
            fontSize: 28.sp),
        headlineMedium: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: fontFamily,
            fontSize: 22.sp),
        headlineSmall: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: fontFamily,
            fontSize: 16.sp),
        titleLarge: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontFamily: fontFamily,
            fontSize: 22.sp),
        titleMedium: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontFamily: fontFamily,
            fontSize: 16.sp),
        titleSmall: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontFamily: fontFamily,
            fontSize: 12.sp),
      ));
  static ThemeData getDarkTheme() => ThemeData(
      scaffoldBackgroundColor: const Color.fromARGB(255, 32, 31, 30),
      colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.mainColor,
          brightness: Brightness.dark,
          secondary: AppColors.secColor,
          primary: AppColors.mainColor),
      useMaterial3: true,
      textTheme: TextTheme(
        displayLarge: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontFamily: fontFamily,
            fontSize: 28.sp),
        displayMedium: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontFamily: fontFamily,
            fontSize: 22.sp),
        displaySmall: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontFamily: fontFamily,
            fontSize: 16.sp),
        headlineLarge: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: fontFamily,
            fontSize: 28.sp),
        headlineMedium: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: fontFamily,
            fontSize: 22.sp),
        headlineSmall: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: fontFamily,
            fontSize: 16.sp),
        titleLarge: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontFamily: fontFamily,
            fontSize: 22.sp),
        titleMedium: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontFamily: fontFamily,
            fontSize: 16.sp),
        titleSmall: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontFamily: fontFamily,
            fontSize: 12.sp),
      ));
}
