import 'package:app/constat.dart';
import 'package:flutter/material.dart';

class CommenTextField extends StatelessWidget {
  const CommenTextField({
    super.key,
    required this.controller,
    required this.title,
    required this.hintText,
  });

  final TextEditingController controller;
  final String title;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
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
            controller: controller,
            decoration: InputDecoration(
                hintText: hintText,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12))),
          ),
        ),
        space
      ],
    );
  }
}
