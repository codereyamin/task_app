import 'package:flutter/foundation.dart';
import 'package:task_app/api/api_method.dart';
import 'package:task_app/api/api_url.dart';
import 'package:task_app/models/project.dart';
import 'package:task_app/widgets/custom_snack_bar.dart';

class ApiServices {
  ApiServices._();

  static Future<List<Project>> getAllProject() async {
    List<Project> projectList = [];
    try {
      var response = await ApiMethod.get(ApiUrl.getAllProject);

      if (response != null) {
        for (var element in response) {
          projectList.add(Project.fromJson(element));
        }
      }

      return projectList;
    } catch (e) {
      debugPrint("error");
    }

    return projectList;
  }

  Future<bool> addProject(Map<String, dynamic> body) async {
    try {
      var responseData = await ApiMethod.post(ApiUrl.createProject, body);
      if (responseData != null) {
        CustomSnackBar.error('Something Went Wrong! Try again');
        return false;
      } else {
        CustomSnackBar.success('Project element created successfully');
        return true;
      }
    } catch (e) {
      debugPrint("error");
      return false;
    }
  }

  Future<bool> updateProject(Map<String, dynamic> body) async {
    try {
      var responseData = await ApiMethod.put(ApiUrl.createProject, body);
      if (responseData != null) {
        CustomSnackBar.error('Something Went Wrong! Try again');
        return false;
      } else {
        CustomSnackBar.success('Project element update successfully');
        return true;
      }
    } catch (e) {
      debugPrint("error");
      return false;
    }
  }
}
