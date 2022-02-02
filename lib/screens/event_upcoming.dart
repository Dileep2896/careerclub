import 'package:careerclub/styles/colors.dart';
import 'package:careerclub/widgets/no_event.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../widgets/event_card.dart';

class EventUpcomingScreen extends StatefulWidget {
  const EventUpcomingScreen({Key? key}) : super(key: key);

  @override
  _EventUpcomingScreenState createState() => _EventUpcomingScreenState();
}

class _EventUpcomingScreenState extends State<EventUpcomingScreen> {
  int noOfCards = 1;
  String eventName = "Upcoming";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: darkColor,
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: Text(
              "$eventName Events",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          noOfCards >= 1
              ? Expanded(
                  child: CarouselSlider(
                    options: CarouselOptions(
                      height: MediaQuery.of(context).size.height,
                      enableInfiniteScroll: false,
                      initialPage: 0,
                      viewportFraction: 0.75,
                      enlargeCenterPage: true,
                    ),
                    items: [
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 50.0,
                          top: 30,
                        ),
                        child: EventsCard(
                          eventName: "Event 1",
                          desc: "This is an Event",
                          register: () {},
                          knowMore: () {},
                          isReg: true,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 50.0,
                          top: 20,
                        ),
                        child: EventsCard(
                          eventName: "Event 2",
                          desc: "This is an Event",
                          register: () {},
                          knowMore: () {},
                          isReg: true,
                        ),
                      ),
                    ],
                  ),
                )
              : NoEventsWidget(
                  eventName: eventName,
                ),
        ],
      ),
    );
  }
}
