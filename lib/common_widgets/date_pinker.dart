import 'package:app/constat.dart';
import 'package:app/controllers/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class DatePinker extends StatelessWidget {
  DatePinker({super.key});
  MyFormController controller = Get.put(MyFormController());
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Treatment Date',
          style:
              TextStyle(fontSize: 15, color: Color.fromARGB(255, 60, 60, 60)),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 60,
          color: Color.fromARGB(255, 238, 238, 238),
          child: TextFormField(
            controller: controller.dateController,
            decoration: InputDecoration(
              hintText: 'Select Date',
              suffixIcon: IconButton(
                icon: Icon(Icons.calendar_today),
                onPressed: () {
                  controller.selectDate(context);
                },
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),

            onTap: () {
              controller.selectDate(context);
            },
            readOnly: true, // Makes the text field read-only
          ),
        ),
        space,
      ],
    );
  }
}
