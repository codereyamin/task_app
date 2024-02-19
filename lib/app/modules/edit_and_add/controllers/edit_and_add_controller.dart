import 'package:flutter/material.dart';

import 'package:get/get.dart';

class EditAndAddController extends GetxController {
  TextEditingController projectName = TextEditingController();
  TextEditingController projectUpdate = TextEditingController();
  TextEditingController assignedEngineer = TextEditingController();
  TextEditingController assignedTechnician = TextEditingController();
  TextEditingController startTime = TextEditingController();
  TextEditingController endTime = TextEditingController();

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

  @override
  void onClose() {
    projectName.dispose();
    projectUpdate.dispose();
    assignedEngineer.dispose();
    assignedTechnician.dispose();
    startTime.dispose();
    endTime.dispose();
    super.onClose();
  }
}
