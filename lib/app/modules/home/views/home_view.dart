import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:task_app/app/routes/app_pages.dart';
import 'package:task_app/utils/app_color.dart';
import 'package:task_app/utils/text_style.dart';

import '../controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: HomeController(),
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Home Page'),
              centerTitle: true,
            ),
            body: HomePageCard(),
          );
        });
  }
}

class HomePageCard extends StatelessWidget {
  const HomePageCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(
          Routes.EDITANDADD,
        );
      },
      child: Container(
        margin: EdgeInsets.all(16),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: AppColor.whiteColor, borderRadius: BorderRadius.circular(8)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Project Name : h ldgkhdglkj lfksghdghj  lkchdlkjh  fjhjdlkjhlbj dlfkhdlkhjdf  lckdkhjdljndbhkj  lkhldkhj",
              style: AppTextStyle.textStyle1,
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              "End Date : 2024-03-05",
              style: AppTextStyle.textStyle2,
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              "h ldgkhdglkj lfksghdghj  lkchdlkjh  fjhjdlkjhlbj dlfkhdlkhjdf  lckdkhjdljndbhkj  lkhldkhj",
              style: AppTextStyle.textStyle3,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
