import 'dart:convert';
import 'package:app/screen/patient_list.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

String tokenkey = '';

class LoginController extends GetxController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  RxBool isLoading = false.obs;
  Future<void> login() async {
    String apiUrl = 'https://flutter-amr.noviindus.in/api/Login';
    isLoading.value = true;
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: {
          'username': usernameController.text.trim(),
          'password': passwordController.text.trim(),
          // 'username': 'test_user',
          // 'password': '12345678',
        },
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        String token = data['token'];
        tokenkey = token;
        print(tokenkey);

        Get.showSnackbar(const GetSnackBar(
          message: 'Login successful',
          duration: Duration(seconds: 2),
        ));
        isLoading.value = false;
        Get.to(() => PatientList());
      } else {
        Get.showSnackbar(const GetSnackBar(
          message: 'Invalid username or password',
          duration: Duration(seconds: 2),
        ));
      }
      isLoading.value = false;
    } catch (e) {
      Get.showSnackbar(const GetSnackBar(
        message: 'Invalid username or password',
        duration: Duration(seconds: 2),
      ));
      isLoading.value = false;
    }
  }
}
