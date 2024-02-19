import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: SplashController(),
        builder: (context) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: Get.width / 10,
                    width: Get.width / 10,
                    child: const CircularProgressIndicator(),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const Text(
                    'Loading.......',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
