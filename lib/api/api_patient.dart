import 'dart:convert';
import 'package:app/controllers/log_sign.dart';
import 'package:app/model/patient_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PatientApi extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getData();
  }

  RxList<PatientModel> patientList = <PatientModel>[].obs;
  String apiPatientList = 'https://flutter-amr.noviindus.in/api/PatientList';

  Future<List<PatientModel>> getData() async {
    try {
      final response = await http.get(
        Uri.parse(apiPatientList),
        headers: {'Authorization': 'Bearer  $tokenkey'},
      );

      if (response.statusCode == 200) {
        final List<PatientModel> data =
            (json.decode(response.body)['patient'] as List)
                .map((json) => PatientModel.fromJson(json))
                .toList();

        update();
        return data;
      } else {
        print('Status code: ${response.statusCode}');
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw e; // Rethrow the error to be caught by the FutureBuilder
    }
  }
}