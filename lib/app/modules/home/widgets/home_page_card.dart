part of '../views/home_view.dart';

class HomePageCard extends StatelessWidget {
  const HomePageCard({super.key, required this.project});
  final Project project;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(
          Routes.EDITANDADD,
          arguments: project,
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
              "Project Name : ${project.projectName}",
              style: AppTextStyle.textStyle1,
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              "End Date : ${project.endDate}",
              style: AppTextStyle.textStyle2,
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              "${project.projectUpdate}",
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
