import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:task_app/api/api_services.dart';
import 'package:task_app/app/modules/home/controllers/home_controller.dart';
import 'package:task_app/models/project.dart';

class EditAndAddController extends GetxController {
  RxBool isAdd = RxBool(true);
  RxBool isLoading = RxBool(false);
  final GlobalKey<FormState> userFieldGlobalKey = GlobalKey<FormState>();
  TextEditingController projectName = TextEditingController();
  TextEditingController projectUpdate = TextEditingController();
  TextEditingController assignedEngineer = TextEditingController();
  TextEditingController assignedTechnician = TextEditingController();
  TextEditingController startDate = TextEditingController();
  TextEditingController endDate = TextEditingController();
  int? id;

  timeSelect(TextEditingController textEditingController) async {
    final date = await showDatePicker(
        context: Get.context!,
        firstDate: DateTime(2024),
        lastDate: DateTime(2030),
        initialDate: textEditingController.text == ""
            ? DateTime.now()
            : DateTime.tryParse(textEditingController.text));

    if (date != null) {
      textEditingController.text = "${date.year}-${date.month}-${date.day}";
    }
  }

  setData(Project project) {
    projectName.text = project.projectName.toString();
    projectUpdate.text = project.projectUpdate.toString();
    assignedEngineer.text = project.assignedEngineer.toString();
    assignedTechnician.text = project.assignedTechnician.toString();
    startDate.text = project.startDate.toString();
    endDate.text = project.endDate.toString();
    id = project.id;
  }

  checkData() {
    var argData = Get.arguments;
    if (argData is Project) {
      isAdd.value = false;
      setData(argData);
    } else {
      isAdd.value = true;
      projectName.clear();
      projectUpdate.clear();
      assignedEngineer.clear();
      assignedTechnician.clear();
      startDate.clear();
      endDate.clear();
    }
  }

  Map<String, dynamic> get bodyData => {
        "project_name": projectName.text,
        "project_update": projectUpdate.text,
        "assigned_engineer": assignedEngineer.text,
        "assigned_technician": assignedTechnician.text,
        "start_date": startDate.text,
        "end_date": endDate.text
      };

  addAndUpdateProject() async {
    if (isAdd.value) {
      if (userFieldGlobalKey.currentState!.validate()) {
        print("Add function call ");
        isLoading.value = true;
        var responseData = await ApiServices.addProject(bodyData);
        if (responseData) {
          Get.find<HomeController>().fetchData();
          Get.close(1);
        }
      }
    } else {
      isLoading.value = true;

      var responseData = await ApiServices.updateProject(bodyData, id!);

      if (responseData) {
        Get.find<HomeController>().fetchData();
        Get.close(1);
      }
    }

    isLoading.value = false;
  }

  @override
  void onInit() {
    checkData();
    super.onInit();
  }

  @override
  void onClose() {
    projectName.dispose();
    projectUpdate.dispose();
    assignedEngineer.dispose();
    assignedTechnician.dispose();
    startDate.dispose();
    endDate.dispose();
    super.onClose();
  }
}
