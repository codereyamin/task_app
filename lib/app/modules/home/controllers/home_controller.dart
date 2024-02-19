import 'package:get/get.dart';
import 'package:task_app/api/api_services.dart';
import 'package:task_app/models/project.dart';

class HomeController extends GetxController {
  RxBool isLoading = RxBool(true);
  RxList<Project> allProject = <Project>[].obs;
  fetchData() async {
    var projectList = await ApiServices.getAllProject();
    allProject.addAll(projectList);
    isLoading.value = false;
    update();
  }

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }
}
