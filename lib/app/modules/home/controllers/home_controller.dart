import 'package:get/get.dart';
import 'package:task_app/api/api_services.dart';
import 'package:task_app/models/project.dart';

class HomeController extends GetxController {
  RxBool isLoading = RxBool(true);
  RxList<Project> allProject = <Project>[].obs;
  fetchData() async {
    isLoading.value = true;
    var projectList = await ApiServices.getAllProject();
    allProject.clear();
    allProject.assignAll(projectList.reversed.toList());
    isLoading.value = false;
  }

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }
}
