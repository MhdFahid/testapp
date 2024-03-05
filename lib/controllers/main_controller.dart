import 'package:app/model/treatItem_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyFormController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController whatsappController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController totalAmountController = TextEditingController();
  TextEditingController discountAmountController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  RxString placetext = 'kozhikode'.obs;
  RxString branchText = ''.obs;
  RxString paymentType = 'Card'.obs;
  RxString treatmentType = ''.obs;
  RxInt female = 1.obs;
  RxInt male = 1.obs;
  RxList<TeatmeItem> teatmeItemList = <TeatmeItem>[].obs;

  DateTime selectedDate = DateTime.now();

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      dateController.text = "${picked.toLocal()}".split(' ')[0];
    }
  }
}
