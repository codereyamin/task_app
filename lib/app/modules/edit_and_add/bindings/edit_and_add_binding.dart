import 'package:get/get.dart';
import 'package:task_app/app/modules/edit_and_add/controllers/edit_and_add_controller.dart';

class EditAndAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditAndAddController>(
      () => EditAndAddController(),
    );
  }
}
