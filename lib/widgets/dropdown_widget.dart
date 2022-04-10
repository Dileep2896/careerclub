import 'package:flutter/material.dart';

import '../styles/colors.dart';

class DropDownWidget extends StatelessWidget {
  const DropDownWidget({
    Key? key,
    required this.dropdown,
    required this.dropdownValue,
    required this.items,
  }) : super(key: key);

  final Function(String? values) dropdown;
  final String dropdownValue;
  final Map<String, String> items;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      isExpanded: true,
      dropdownColor: darkColor,
      value: dropdownValue,
      icon: const Icon(
        Icons.arrow_drop_down,
        color: primaryColor,
      ),
      style: const TextStyle(color: primaryColor),
      underline: Container(
        height: 2,
        color: primaryColor,
      ),
      onChanged: dropdown,
      items: items.values
          .toSet()
          .toList()
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

// (String? newValue) {
//               setState(() {
//                 dropdownValue = newValue!;
//               });
//             }
