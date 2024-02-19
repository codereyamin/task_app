import 'package:flutter/material.dart';
import 'package:task_app/utils/app_color.dart';

ThemeData appThemeData = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primaryColor),
  scaffoldBackgroundColor: AppColor.scaffoldColor,
  appBarTheme: const AppBarTheme(
      backgroundColor: AppColor.scaffoldColor,
      foregroundColor: AppColor.appColor),
  useMaterial3: true,
);
