import 'dart:convert';
import 'package:app/controllers/log_sign.dart';
import 'package:app/model/treatment_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class TreatmentntApi extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getData();
  }

  String apiTreatmentList =
      'https://flutter-amr.noviindus.in/api/TreatmentList';

  Future<List<TreatmentModel>> getData() async {
    try {
      final response = await http.get(
        Uri.parse(apiTreatmentList),
        headers: {'Authorization': 'Bearer  $tokenkey'},
      );

      if (response.statusCode == 200) {
        final List<TreatmentModel> data =
            (json.decode(response.body)['treatments'] as List)
                .map((json) => TreatmentModel.fromJson(json))
                .toList();

        update();
        return data;
      } else {
        print('Status code: ${response.statusCode}');
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
      throw e;
    }
  }
}
