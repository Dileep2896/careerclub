import 'package:flutter/material.dart';

import '../styles/colors.dart';

// ignore: must_be_immutable
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
      decoration: const BoxDecoration(
        color: darkColor,
        borderRadius: BorderRadius.all(
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
