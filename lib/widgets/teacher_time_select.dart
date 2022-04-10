import 'package:careerclub/styles/colors.dart';
import 'package:careerclub/widgets/dropdown_widget.dart';
import 'package:flutter/material.dart';

class TecherTimeSelect extends StatelessWidget {
  const TecherTimeSelect({
    Key? key,
    required this.time,
    required this.period,
    required this.dropdown,
    required this.dropdownValue,
    required this.items,
  }) : super(key: key);

  final String time;
  final String period;

  final Function(String? values) dropdown;
  final String dropdownValue;
  final Map<String, String> items;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "$time ",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  " Period $period ",
                  style: const TextStyle(
                    color: primaryColor,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            DropDownWidget(
              dropdown: dropdown,
              dropdownValue: dropdownValue,
              items: items,
            ),
          ],
        ),
      ),
    );
  }
}
