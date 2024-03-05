import 'package:app/constat.dart';
import 'package:app/controllers/main_controller.dart';
import 'package:app/model/treatItem_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class TreatmentItem extends StatelessWidget {
  TreatmentItem({
    super.key,
  });
  MyFormController controller = Get.put(MyFormController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: List.generate(controller.teatmeItemList.length, (index) {
          TeatmeItem teatmeItem = controller.teatmeItemList[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  boxShadow: [BoxShadow(color: Colors.black26)],
                  color: Color.fromARGB(212, 245, 248, 250),
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${index + 1}. ${teatmeItem.title}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color.fromARGB(255, 70, 70, 70)),
                    ),
                    Row(
                      children: [
                        space,
                        space,
                        Text(
                          'Male: ${teatmeItem.male}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Color.fromARGB(255, 57, 205, 55)),
                        ),
                        space,
                        space,
                        Text(
                          'Female: ${teatmeItem.female}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Color.fromARGB(255, 57, 205, 55)),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
