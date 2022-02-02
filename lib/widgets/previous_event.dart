import 'package:careerclub/widgets/event_card.dart';
import 'package:flutter/material.dart';

import '../styles/colors.dart';

class PreviousEvent extends StatelessWidget {
  const PreviousEvent({
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
                      "Previous Events",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    EventsCard(
                      eventName: "Event 1 Done",
                      desc:
                          "This event gives you this and helps you learn this, participating in this event will increase your knowledge",
                      register: () {},
                      knowMore: () {},
                      isReg: true,
                    ),
                    EventsCard(
                      eventName: "Event 2 Done",
                      desc:
                          "This event gives you this and helps you learn this, participating in this event will increase your knowledge",
                      register: () {},
                      knowMore: () {},
                      isReg: true,
                    ),
                    EventsCard(
                      eventName: "Event 3 Done",
                      desc:
                          "This event gives you this and helps you learn this, participating in this event will increase your knowledge",
                      register: () {},
                      knowMore: () {},
                      isReg: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
