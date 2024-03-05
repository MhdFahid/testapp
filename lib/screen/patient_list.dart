import 'package:app/api/api_patient.dart';
import 'package:app/constat.dart';
import 'package:app/model/patient_model.dart';
import 'package:app/screen/card/card_items.dart';
import 'package:app/screen/register.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class PatientList extends StatelessWidget {
  PatientApi patientApi = Get.put(PatientApi());
  PatientList({super.key});
  RxList<PatientModel> patientList = <PatientModel>[].obs;
  void getPatientList() async {
    patientList.value = await patientApi.getData();
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
      body: Obx(() {
        getPatientList();
        return patientList.isNotEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 50,
                            child: TextField(
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.search),
                                  hintText: 'search',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                          ),
                        ),
                        space,
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color.fromARGB(255, 1, 84, 5)),
                            height: 50,
                            width: 80,
                            child: Center(
                                child: Text('Search',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold))),
                          ),
                        )
                      ],
                    ),
                  ),
                  // space,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        Text('Sort by',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 26, 26, 26))),
                        Spacer(),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.black12)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  'Date',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 26, 26, 26)),
                                ),
                                space,
                                DropdownButton(
                                    items: [], onChanged: (value) {}),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: patientList.length,
                        itemBuilder: (context, index) {
                          PatientModel patient = patientList[index];
                          return CardItem(
                            index: index,
                            name: patient.name,
                            address: patient.address,
                            createdDate: patient.createdAt,
                          );
                        },
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: InkWell(
                      onTap: () {
                        Get.to(() => RegisterScreen());
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color.fromARGB(255, 1, 84, 5)),
                        height: 60,
                        width: double.infinity,
                        child: Center(
                          child: Text(
                            'Register Now',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  space,
                ],
              )
            : Center(
                child: CircularProgressIndicator(),
              );
      }),
    );
  }
}
