// ignore: must_be_immutable
import 'package:flutter/material.dart';

import '../styles/colors.dart';

// ignore: must_be_immutable
class InfoContainer extends StatelessWidget {
  InfoContainer({
    Key? key,
    required this.information,
    required this.subject,
    this.fontSize = 16,
  }) : super(key: key);

  String information;
  String subject;
  double fontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.6,
      decoration: BoxDecoration(
        color: darkColor,
        border: Border.all(
          color: primaryColor,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            information,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: fontSize,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
