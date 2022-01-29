import 'package:flutter/material.dart';

import '../styles/colors.dart';

class NoEventsWidget extends StatelessWidget {
  NoEventsWidget({
    required this.eventName,
    Key? key,
  }) : super(key: key);

  String eventName;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.3,
      height: 50,
      decoration: BoxDecoration(
        color: primaryColor,
        border: Border.all(
          color: primaryColor,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Center(
        child: Text(
          "No $eventName Events",
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
    );
  }
}
