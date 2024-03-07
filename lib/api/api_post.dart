import 'dart:convert';
import 'package:app/controllers/log_sign.dart';
import 'package:app/controllers/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

// class PostApi extends GetConnect {
//   MyFormController controller = Get.put(MyFormController());
//   Future<void> postRequest() async {
//     const String apiUrl = "https://flutter-amr.noviindus.in/api/PatientUpdate";

//     // Your data to be sent in the request body
//     Map<String, dynamic> postData = {
//       // "name": controller.nameController.text,
//       // "excecutive": "excecutive",
//       // "payment": controller.paymentType.value,
//       // "phone": controller.whatsappController.text,
//       // "address": controller.placetext.value,
//       // "total_amount": controller.totalAmountController.value,
//       // "discount_amount": controller.discountAmountController.value,
//       // "advance_amount": '1111',
//       // "date_nd_time": controller.dateController.value,
//       // "id": 3221,
//       // "male": controller.male.value,
//       // "female": controller.female.value,
//       // "branch": controller.branchText.value,
//       // "treatments": controller.treatmentType.value,
//       "name": 'fahid',
//       "excecutive": 'fahid',
//       "payment": 'card',
//       "phone": '3456765',
//       "address": 'Nadapuram',
//       // "total_amount": controller.totalAmountController.value,
//       // "discount_amount": controller.discountAmountController.value,
//       // "advance_amount": '1111',
//       // "date_nd_time": controller.dateController.value,
//       // "id": 3221,
//       // "male": controller.male.value,
//       // "female": controller.female.value,
//       // "branch": controller.branchText.value,
//       // "treatments": controller.treatmentType.value,
//     };

//     try {
//       final response = await http.post(
//         Uri.parse(apiUrl),
//         headers: {
//           'Content-Type': 'application/json',
//           'Authorization': 'Bearer $tokenkey',
//         },
//         body: jsonEncode(postData),
//       );

//       if (response.statusCode == 200) {
//         print("Success: ${response.body}");
//       } else {
//         print("Error: ${response.statusCode}");
//         print("Body: ${response.body}");
//       }
//     } catch (e) {
//       print("Error: $e");
//     }
//   }
// }

class PostApis extends GetConnect {
  final LoginController loginController = Get.put(LoginController());

  RxBool isLoading = false.obs;
  // Future<void> makeAuthenticatedRequest() async {
  //   String apiUrl = "https://flutter-amr.noviindus.in/api/PatientUpdate";
  //   isLoading = true.obs;
  //   final Map<String, String> headers = {
  //     'Content-Type': 'application/json',
  //     'Accept': 'application/json',
  //     'Authorization': 'Bearer $tokenkey',
  //   };

  //   Map<String, dynamic> postData = {
  //     "id": 1315,
  //     "patientdetails_set": [
  //       {
  //         "id": 2554,
  //         "male": "2",
  //         "female": "2",
  //         "patient": 1315,
  //         "treatment": 75,
  //         "treatment_name": "Ayurvedic Cream Massage"
  //       }
  //     ],
  //     "branch": {
  //       "id": 162,
  //       "name": "vvvyvyy",
  //       "patients_count": 0,
  //       "location": "Kozhikode",
  //       "phone": "9946331452,9747331452",
  //       "mail": "user123@gmail.com",
  //       "address": "Kozhikode",
  //       "gst": "",
  //       "is_active": true
  //     }
  //   };

  //   final response = await http.post(
  //     Uri.parse(apiUrl),
  //     headers: headers,
  //     body: jsonEncode(postData),
  //   );

  //   if (response.statusCode == 200) {
  //     isLoading = false.obs;
  //     print('API response: ${response.body}');
  //   } else {
  //     isLoading = false.obs;
  //     print('API error: ${response.statusCode}');
  //   }
  // }

  void postData() async {
    loginController.isLoading.value = true;
    const apiUrl = 'https://flutter-amr.noviindus.in/api/PatientUpdate';
    final response = await http.post(
      Uri.parse(apiUrl),
      body: jsonEncode({'name': 'fghjkl'}),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer  $tokenkey'
      },
    );
    loginController.isLoading.value = true;
    if (response.statusCode == 200) {
      Get.snackbar(
        'Success',
        'POST request successful!',
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      loginController.isLoading.value = false;
    } else {
      Get.snackbar(
        'Error',
        'Failed to make POST request. Status code: ${response.statusCode}',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      loginController.isLoading.value = false;
    }
  }
}
