
import 'package:app/constat.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    super.key,
    required this.index,
    required this.name,
    required this.address,
    required this.createdDate,
  });
  final int index;
  final String name;
  final String address;
  final String createdDate;
  @override
  Widget build(BuildContext context) {
    // Format the date string without parsing it into a DateTime object
    String formattedDate =
        DateFormat('dd-MM-yyyy').format(DateTime.parse(createdDate));

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                boxShadow: [BoxShadow(color: Colors.black26)],
                color: Color.fromARGB(214, 240, 239, 239),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      space,
                      Text('${index + 1}.',
                          style: TextStyle(
                              fontSize: 25,
                              color: const Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.w500)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: TextStyle(
                                fontSize: 25,
                                color: const Color.fromARGB(255, 0, 0, 0),
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            address,
                            style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 5, 193, 21),
                            ),
                          ),
                          space,
                          Row(
                            children: [
                              Icon(Icons.calendar_month,
                                  color: Color.fromARGB(229, 205, 6, 6)),
                              space,
                              space,
                              Text(
                                formattedDate,
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Color.fromARGB(255, 97, 98, 97),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                space,
                Container(
                    width: double.infinity,
                    height: 2,
                    color: Color.fromARGB(192, 193, 193, 193)),
                space,
                Row(
                  children: [
                    space,
                    space,
                    space,
                    Text(
                      'View Booking details',
                      style: TextStyle(
                          fontSize: 15, color: Color.fromARGB(255, 77, 77, 77)),
                    ),
                    Spacer(),
                    Icon(
                      Icons.navigate_next,
                      color: Colors.green,
                      size: 30,
                    ),
                    space,
                  ],
                ),
                space,
              ],
            ),
          ),
        ),
      ],
    );
  }
}
