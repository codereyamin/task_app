import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:task_app/api/api_url.dart';
import 'package:task_app/widgets/custom_snack_bar.dart';

Map<String, String> basicHeaderInfo() {
  return {
    HttpHeaders.acceptHeader: "application/json",
    HttpHeaders.contentTypeHeader: "application/json",
  };
}

class ApiMethod {
  ApiMethod._();

  // Get method
  static Future get(
    String url,
  ) async {
    try {
      final response = await http
          .get(
            Uri.parse(url),
            headers: basicHeaderInfo(),
          )
          .timeout(const Duration(seconds: 15));

      if (response.statusCode >= 200 && response.statusCode <= 290) {
        return jsonDecode(response.body);
      } else {
        return null;
      }
    } on SocketException {
      CustomSnackBar.error('Check your Internet Connection and try again!');
      return null;
    } on TimeoutException {
      CustomSnackBar.error('Something Went Wrong! Try again');
      return null;
    } on http.ClientException catch (err, stackrace) {
      debugPrint(stackrace.toString());
      CustomSnackBar.error('Something Went Wrong! Try again');
      return null;
    } catch (e) {
      return null;
    }
  }

  // Post Method
  static Future post(
    String url,
    Map<String, dynamic> body,
  ) async {
    try {
      print("add project call ");
      print(url);
      print(body);
      final response = await http
          .post(
            Uri.parse(url),
            body: jsonEncode(body),
            headers: basicHeaderInfo(),
          )
          .timeout(const Duration(seconds: 30));
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 301) {
        String? newUrl = response.headers['location'];

        if (newUrl != null) {
          return post("${ApiUrl.domain}$newUrl", body);
        } else {
          throw Exception('Redirection URL not found');
        }
      }
      if (response.statusCode >= 200 && response.statusCode <= 290) {
        return jsonDecode(response.body);
      } else {
        return null;
      }
    } on SocketException {
      CustomSnackBar.error('Check your Internet Connection and try again!');
      return null;
    } on TimeoutException {
      CustomSnackBar.error('Something Went Wrong! Try again');
      return null;
    } on http.ClientException catch (err, stackrace) {
      debugPrint(stackrace.toString());
      CustomSnackBar.error('Something Went Wrong! Try again');
      return null;
    } catch (e) {
      return null;
    }
  }

  // put Method
  static Future<Map<String, dynamic>?> put(
    String url,
    Map<String, dynamic> body,
  ) async {
    try {
      final response = await http
          .put(
            Uri.parse(url),
            body: jsonEncode(body),
            headers: basicHeaderInfo(),
          )
          .timeout(const Duration(seconds: 30));
      if (response.statusCode == 301) {
        String? newUrl = response.headers['location'];

        if (newUrl != null) {
          return put("${ApiUrl.domain}$newUrl", body);
        } else {
          throw Exception('Redirection URL not found');
        }
      }
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        return jsonDecode(response.body);
      } else {
        return null;
      }
    } on SocketException {
      CustomSnackBar.error('Check your Internet Connection and try again!');
      return null;
    } on TimeoutException {
      CustomSnackBar.error('Request Timed out! Try again');
      return null;
    } on http.ClientException catch (err, stackrace) {
      debugPrint(stackrace.toString());
      CustomSnackBar.error('Something Went Wrong! Try again');
      return null;
    } catch (e) {
      return null;
    }
  }
}
