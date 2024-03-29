import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_app/app/modules/edit_and_add/controllers/edit_and_add_controller.dart';
import 'package:task_app/utils/app_color.dart';
import 'package:task_app/utils/text_style.dart';
part '../widgets/app_input_text_field.dart';

class EditAndAddView extends StatelessWidget {
  const EditAndAddView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: EditAndAddController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              forceMaterialTransparency: true,
            ),
            body: Form(
              key: controller.userFieldGlobalKey,
              child: ListView(
                children: [
                  AppInputTextField(
                    title: "Project Name",
                    textEditingController: controller.projectName,
                  ),
                  AppInputTextField(
                    title: "Assigned Engineer",
                    textEditingController: controller.assignedEngineer,
                  ),
                  AppInputTextField(
                    title: "Assigned Technician",
                    textEditingController: controller.assignedTechnician,
                  ),
                  AppInputTextField(
                    title: "project Update",
                    textEditingController: controller.projectUpdate,
                    textInputAction: TextInputAction.newline,
                    mainLines: 2,
                    maxLength: 250,
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: AppInputTextField(
                          onTap: () {
                            controller.timeSelect(controller.startDate);
                          },
                          readOnly: true,
                          title: "Start Date",
                          textEditingController: controller.startDate,
                        ),
                      ),
                      Flexible(
                        child: AppInputTextField(
                          onTap: () {
                            controller.timeSelect(controller.endDate);
                          },
                          readOnly: true,
                          title: "End Date",
                          textEditingController: controller.endDate,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Obx(
                    () => Align(
                      alignment: Alignment.center,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          if (!controller.isLoading.value) {
                            controller.addAndUpdateProject();
                          }
                        },
                        icon: const Icon(
                          Icons.add,
                          size: 40,
                        ),
                        label: controller.isLoading.value
                            ? const Text(
                                "Loading.....",
                                style: AppTextStyle.textStyle1,
                              )
                            : Text(
                                controller.isAdd.value
                                    ? "Add Project"
                                    : "Update",
                                style: AppTextStyle.textStyle1,
                              ),
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8))),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                ],
              ),
            ),
          );
        });
  }
}
