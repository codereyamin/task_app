import 'package:get/get.dart';
import 'package:task_app/app/modules/edit_and_add/bindings/edit_and_add_binding.dart';
import '../modules/edit_and_add/views/edit_and_add_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.EDITANDADD,
      page: () => const EditAndAddView(),
      binding: EditAndAddBinding(),
    ),
  ];
}
