import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_app/app/routes/app_pages.dart';
import 'package:task_app/utils/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter task app',
      theme: appThemeData,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
