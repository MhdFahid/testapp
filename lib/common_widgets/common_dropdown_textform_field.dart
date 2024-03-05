// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:app/constat.dart';

class CommenDropDown extends StatelessWidget {
  CommenDropDown({
    Key? key,
    required this.title,
    required this.hintText,
    required this.value,
    required this.list,
    required this.onChanged,
  }) : super(key: key);

  final String title;
  final String hintText;
  final String value;
  final List<String> list;
  final void Function(String? value) onChanged;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title == ''
            ? SizedBox()
            : Text(
                title,
                style: TextStyle(
                    fontSize: 15, color: Color.fromARGB(255, 60, 60, 60)),
              ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 60,
          color: Color.fromARGB(255, 238, 238, 238),
          child: DropdownButtonFormField<String>(
            isExpanded: true,
            // value: value,
            onChanged: onChanged,

            items: list.map((String district) {
              return DropdownMenuItem<String>(
                value: district,
                child: Text(district),
              );
            }).toList(),
            decoration: InputDecoration(
                hintText: hintText,
                hintStyle: const TextStyle(overflow: TextOverflow.clip),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12))),
          ),
        ),
        space
      ],
    );
  }
}
