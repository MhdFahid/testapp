import 'dart:convert';
import 'package:app/controllers/log_sign.dart';
import 'package:app/model/branch_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class BranchApi extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getData();
  }

  String apiBranchList = 'https://flutter-amr.noviindus.in/api/BranchList';

  Future<List<BranchModel>> getData() async {
    try {
      final response = await http.get(
        Uri.parse(apiBranchList),
        headers: {'Authorization': 'Bearer  $tokenkey'},
      );

      if (response.statusCode == 200) {
        final List<BranchModel> data =
            (json.decode(response.body)['branches'] as List)
                .map((json) => BranchModel.fromJson(json))
                .toList();

        update();
        return data;
      } else {
        print('Error fetching data. Status code: ${response.statusCode}');
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error fetching data: $e');
      throw e; // Rethrow the error to be caught by the FutureBuilder
    }
  }
}
