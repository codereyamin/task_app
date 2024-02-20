import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_app/app/routes/app_pages.dart';
import 'package:task_app/models/project.dart';
import 'package:task_app/utils/app_color.dart';
import 'package:task_app/utils/text_style.dart';

import '../controllers/home_controller.dart';
part '../widgets/home_page_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: HomeController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('All Project'),
              centerTitle: true,
            ),
            body: Obx(
              () => controller.isLoading.value
                  ? Center(
                      child: SizedBox(
                        width: Get.width / 10,
                        height: Get.width / 10,
                        child: const CircularProgressIndicator(),
                      ),
                    )
                  : ListView.builder(
                      itemCount: controller.allProject.length,
                      itemBuilder: (context, index) {
                        Project project = controller.allProject[index];
                        return HomePageCard(
                          project: project,
                        );
                      },
                    ),
            ),
            floatingActionButton: FloatingActionButton.extended(
                icon: const Icon(Icons.add),
                onPressed: () {
                  Get.toNamed(Routes.EDITANDADD);
                },
                label: const Text("Add New Project")),
          );
        });
  }
}
