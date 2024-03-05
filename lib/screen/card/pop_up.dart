import 'package:app/common_widgets/common_button.dart';
import 'package:app/common_widgets/common_dropdown_textform_field.dart';
import 'package:app/constat.dart';
import 'package:app/controllers/main_controller.dart';
import 'package:app/model/treatItem_model.dart';
import 'package:app/model/treatment_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopUp extends StatelessWidget {
  PopUp({super.key, required this.treatmentntList});

  final MyFormController controller = Get.put(MyFormController());
  final List<TreatmentModel> treatmentntList;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.dialog(
          Dialog(
            child: Obx(
              () {
                return Container(
                  width: 300,
                  height: 400,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 246, 246, 246),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: treatmentntList.isNotEmpty
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              space,
                              space,
                              CommenDropDown(
                                  onChanged: (value) {
                                    controller.treatmentType.value = value!;
                                  },
                                  title: 'Choose Treatment',
                                  hintText: 'Choose prefered treatment',
                                  list: List.generate(treatmentntList.length,
                                      (index) {
                                    TreatmentModel treatments =
                                        treatmentntList[index];
                                    return treatments.name;
                                  }),
                                  value: controller.treatmentType.value),
                              space,
                              const Text('Add Patients'),
                              space,
                              space,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color.fromARGB(
                                          96, 211, 208, 208),
                                    ),
                                    width: 80,
                                    height: 50,
                                    child: const Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(left: 8.0),
                                          child: Text(
                                            textAlign: TextAlign.left,
                                            'Male',
                                            style: TextStyle(
                                                // fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                                color: Color.fromARGB(
                                                    255, 57, 57, 57)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  ChangeBt(
                                      title: '-',
                                      onTap: () {
                                        if (controller.male.value > 0) {
                                          controller.male.value =
                                              controller.male.value - 1;
                                        }
                                      }),
                                  space,
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color.fromARGB(
                                          96, 211, 208, 208),
                                    ),
                                    width: 50,
                                    height: 50,
                                    child: Center(
                                        child: Text(
                                      '${controller.male.value}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color:
                                              Color.fromARGB(255, 36, 36, 36)),
                                    )),
                                  ),
                                  space,
                                  ChangeBt(
                                    title: '+',
                                    onTap: () {
                                      controller.male.value++;
                                    },
                                  )
                                ],
                              ),
                              space,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color.fromARGB(
                                          96, 211, 208, 208),
                                    ),
                                    width: 80,
                                    height: 50,
                                    child: const Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(left: 8.0),
                                          child: Text(
                                            textAlign: TextAlign.left,
                                            'Female',
                                            style: TextStyle(
                                                // fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                                color: const Color.fromARGB(
                                                    255, 57, 57, 57)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  ChangeBt(
                                      title: '-',
                                      onTap: () {
                                        if (controller.female.value > 0) {
                                          controller.female.value =
                                              controller.female.value - 1;
                                        }
                                      }),
                                  space,
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color.fromARGB(
                                          96, 211, 208, 208),
                                    ),
                                    width: 50,
                                    height: 50,
                                    child: Center(
                                        child: Text(
                                      '${controller.female.value}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color:
                                              Color.fromARGB(255, 36, 36, 36)),
                                    )),
                                  ),
                                  space,
                                  ChangeBt(
                                      title: '+',
                                      onTap: () {
                                        controller.female.value++;
                                      })
                                ],
                              ),
                              space,
                              const Spacer(),
                              CommonButton(
                                  title: 'Save',
                                  onTap: () {
                                    controller.teatmeItemList.add(
                                      TeatmeItem(
                                          id: 1,
                                          title: controller.treatmentType.value,
                                          female: controller.female.value,
                                          male: controller.male.value),
                                    );
                                    controller.treatmentType.value = '';
                                    controller.female.value = 0;
                                    controller.male.value = 0;
                                    Get.back();
                                  }),
                              space,
                              space
                            ],
                          )
                        : const Center(
                            child: CircularProgressIndicator(),
                          ),
                  ),
                );
              },
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: const Color.fromARGB(144, 7, 87, 11)),
        height: 60,
        width: double.infinity,
        child: const Center(
          child: Text(
            '+ Add Treatments',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Color.fromARGB(255, 255, 255, 255)),
          ),
        ),
      ),
    );
  }
}

class ChangeBt extends StatelessWidget {
  const ChangeBt({
    super.key,
    required this.title,
    required this.onTap,
  });
  final String title;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
            shape: BoxShape.circle, color: Color.fromARGB(255, 10, 89, 13)),
        width: 40,
        height: 40,
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Color.fromARGB(255, 255, 255, 255)),
          ),
        ),
      ),
    );
  }
}
