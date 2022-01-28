import 'package:careerclub/components/constants.dart';
import 'package:careerclub/components/event_card.dart';
import 'package:careerclub/components/start_event_card.dart';
import 'package:flutter/material.dart';

class RegisteredEvent extends StatelessWidget {
  const RegisteredEvent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: primaryColor,
                        width: 1.0,
                      ),
                    ),
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: const Padding(
                    padding: EdgeInsets.only(bottom: 5.0, top: 5.0),
                    child: Text(
                      "Registered Events",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      StartEventCard(
                        eventName: "Event 1",
                        time: 454545,
                      ),
                      StartEventCard(
                        eventName: "Event 2",
                        time: 505050,
                      ),
                      StartEventCard(
                        eventName: "Event 3",
                        time: 999999,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
