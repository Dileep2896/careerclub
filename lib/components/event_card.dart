import 'package:careerclub/components/constants.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class EventsCard extends StatelessWidget {
  EventsCard(
      {Key? key,
      required this.eventName,
      required this.desc,
      required this.register,
      required this.knowMore,
      required this.isPrev})
      : super(key: key);

  String eventName;
  String desc;
  final register;
  final knowMore;
  bool isPrev;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15.0,
        top: 10.0,
        bottom: 10.0,
      ),
      child: Container(
        width: MediaQuery.of(context).size.width / 1.3,
        decoration: BoxDecoration(
          color: darkColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
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
              Flexible(
                child: RichText(
                  overflow: TextOverflow.fade,
                  strutStyle: const StrutStyle(fontSize: 12.0),
                  text: TextSpan(
                    style: const TextStyle(color: Colors.white),
                    text: desc,
                  ),
                ),
              ),
              Row(
                children: [
                  isPrev
                      ? Container()
                      : TextButton(
                          onPressed: register,
                          style: TextButton.styleFrom(
                            primary: primaryColor,
                          ),
                          child: const Text(
                            "Register",
                          ),
                        ),
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
      ),
    );
  }
}
