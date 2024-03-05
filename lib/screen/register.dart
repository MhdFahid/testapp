import 'package:app/api/api_branches.dart';
import 'package:app/api/api_patient.dart';
import 'package:app/api/api_post.dart';
import 'package:app/api/api_treatmentnt.dart';
import 'package:app/common_widgets/common_TextForm_field.dart';
import 'package:app/common_widgets/common_button.dart';
import 'package:app/common_widgets/common_dropdown_textform_field.dart';
import 'package:app/common_widgets/date_pinker.dart';
import 'package:app/constat.dart';
import 'package:app/controllers/main_controller.dart';
import 'package:app/model/branch_model.dart';
import 'package:app/model/patient_model.dart';
import 'package:app/model/treatment_model.dart';
import 'package:app/screen/card/pop_up.dart';
import 'package:app/screen/card/teatmentItem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatelessWidget {
  PatientApi patientApi = Get.put(PatientApi());
  TreatmentntApi treatmentntApi = Get.put(TreatmentntApi());
  BranchApi branchApi = Get.put(BranchApi());
  PostApis postApi = Get.put(PostApis());

  final MyFormController controller = Get.put(MyFormController());

  RegisterScreen({super.key});
  RxList<PatientModel> patientList = <PatientModel>[].obs;
  RxList<BranchModel> branchList = <BranchModel>[].obs;
  RxList<TreatmentModel> treatmentntList = <TreatmentModel>[].obs;
  final formKey = GlobalKey<FormState>();

  void getPatientList() async {
    patientList.value = await patientApi.getData();
  }

  void getBranchList() async {
    branchList.value = await branchApi.getData();
  }

  void getTreatmentntList() async {
    treatmentntList.value = await treatmentntApi.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.notifications),
          ),
          space
        ],
      ),
      body: Obx(
        () {
          getTreatmentntList();
          getBranchList();
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Register',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                    ),
                    space,
                    Container(
                      color: Colors.black12,
                      width: double.infinity,
                      height: 2,
                    ),
                    space,
                    CommenTextFormField(
                        controller: controller.nameController,
                        title: 'Name',
                        hintText: 'Enter your full name'),
                    CommenTextFormField(
                        controller: controller.whatsappController,
                        title: 'Whatsapp Number',
                        hintText: 'Enter your Whatsapp number'),
                    CommenTextFormField(
                        controller: controller.addressController,
                        title: 'Address',
                        hintText: 'Enter your address'),
                    CommenDropDown(
                      onChanged: (value) {
                        controller.placetext.value = value!;
                      },
                      list: keralaDistricts,
                      title: 'Location',
                      hintText: 'Location',
                      value: controller.placetext.value,
                    ),
                    branchList.isEmpty
                        ? Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Center(child: CircularProgressIndicator()),
                          )
                        : CommenDropDown(
                            onChanged: (value) {
                              controller.branchText.value = value!;
                            },
                            list: List.generate(branchList.length, (index) {
                              BranchModel branch = branchList[index];
                              return branch.name;
                            }),
                            title: 'Branch',
                            hintText: 'Select the branch',
                            value: controller.branchText.value,
                          ),
                    Text('Treatments'),
                    TreatmentItem(),
                    space,
                    PopUp(
                      treatmentntList: treatmentntList,
                    ),
                    space,
                    CommenTextFormField(
                        controller: controller.totalAmountController,
                        title: 'Total Amount',
                        hintText: ''),
                    CommenTextFormField(
                        controller: controller.discountAmountController,
                        title: 'Discount Amount',
                        hintText: ''),
                    CommenDropDown(
                      onChanged: (value) {
                        controller.paymentType.value = value!;
                      },
                      list: const ['Cash', 'Card', 'UPI'],
                      title: 'Payment Option',
                      hintText: 'Payment',
                      value: controller.paymentType.value,
                    ),
                    DatePinker(),
                    space,
                    CommonButton(
                        title: 'Save',
                        onTap: () {
                          postApi.postRequest();
                          // if (formKey.currentState!.validate()) {

                          // }
                        }),
                    space,
                    space,
                    space,
                    space
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
