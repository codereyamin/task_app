import 'package:get/get.dart';
import 'package:task_app/app/routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    onPageRun();
    super.onInit();
  }

  onPageRun() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        Get.offAllNamed(Routes.HOME);
      },
    );
  }
}
