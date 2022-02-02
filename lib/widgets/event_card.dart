import 'package:flutter/material.dart';

import '../styles/colors.dart';

// ignore: must_be_immutable
class EventsCard extends StatelessWidget {
  EventsCard(
      {Key? key,
      required this.eventName,
      required this.desc,
      required this.register,
      required this.knowMore,
      required this.isReg})
      : super(key: key);

  String eventName;
  String desc;
  // ignore: prefer_typing_uninitialized_variables
  final register;
  // ignore: prefer_typing_uninitialized_variables
  final knowMore;
  bool isReg;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.3,
      decoration: BoxDecoration(
        color: darkColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(
          20.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  eventName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                RichText(
                  overflow: TextOverflow.fade,
                  strutStyle: const StrutStyle(fontSize: 12.0),
                  text: TextSpan(
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    text: desc,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                isReg
                    ? TextButton(
                        onPressed: register,
                        style: TextButton.styleFrom(
                          primary: primaryColor,
                        ),
                        child: const Text(
                          "Register",
                        ),
                      )
                    : Container(),
                TextButton(
                  onPressed: knowMore,
                  style: TextButton.styleFrom(
                    primary: Colors.yellow.shade700,
                  ),
                  child: const Text(
                    "Know More",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
