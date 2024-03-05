import 'dart:convert';
import 'package:app/controllers/log_sign.dart';
import 'package:app/controllers/main_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class PostApi extends GetConnect {
  MyFormController controller = Get.put(MyFormController());
  Future<void> postRequest() async {
    const String apiUrl = "https://flutter-amr.noviindus.in/api/PatientUpdate";

    // Your data to be sent in the request body
    Map<String, dynamic> postData = {
      // "name": controller.nameController.text,
      // "excecutive": "excecutive",
      // "payment": controller.paymentType.value,
      // "phone": controller.whatsappController.text,
      // "address": controller.placetext.value,
      // "total_amount": controller.totalAmountController.value,
      // "discount_amount": controller.discountAmountController.value,
      // "advance_amount": '1111',
      // "date_nd_time": controller.dateController.value,
      // "id": 3221,
      // "male": controller.male.value,
      // "female": controller.female.value,
      // "branch": controller.branchText.value,
      // "treatments": controller.treatmentType.value,
      "name": 'fahid',
      "excecutive": 'fahid',
      "payment": 'card',
      "phone": '3456765',
      "address": 'Nadapuram',
      // "total_amount": controller.totalAmountController.value,
      // "discount_amount": controller.discountAmountController.value,
      // "advance_amount": '1111',
      // "date_nd_time": controller.dateController.value,
      // "id": 3221,
      // "male": controller.male.value,
      // "female": controller.female.value,
      // "branch": controller.branchText.value,
      // "treatments": controller.treatmentType.value,
    };

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $tokenkey',
        },
        body: jsonEncode(postData),
      );

      if (response.statusCode == 200) {
        print("Success: ${response.body}");
      } else {
        print("Error: ${response.statusCode}");
        print("Body: ${response.body}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }
}

class PostApis extends GetConnect {
  final String apiUrl = "https://flutter-amr.noviindus.in/api/PatientUpdate";

  Future<void> postRequest() async {
    // Your data to be sent in the request body
    Map<String, dynamic> postData = {
      "name": 'fahid',
      "excecutive": 'fahid',
      "payment": 'card',
      "phone": '3456765',
      "address": 'Nadapuram',
    };

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $tokenkey',
        },
        body: jsonEncode(postData),
      );

      if (response.statusCode == 200) {
        print("Success: ${response.body}");
        // Handle success, update UI, etc.
      } else {
        print("Error: ${response.statusCode}");
        print("Body: ${response.body}");
        // Handle error, show error message, etc.
      }
    } catch (e) {
      print("Error: $e");
      // Handle error, show error message, etc.
    }
  }
}
