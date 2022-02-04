import 'package:careerclub/styles/colors.dart';
import 'package:careerclub/widgets/no_event.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../widgets/event_card.dart';

class FavEventScreen extends StatefulWidget {
  const FavEventScreen({Key? key}) : super(key: key);

  static String id = "event_past_screen";

  @override
  State<FavEventScreen> createState() => _FavEventScreenState();
}

class _FavEventScreenState extends State<FavEventScreen> {
  int noOfCards = 1;
  String eventName = "FAVIROATE";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(
              top: 20,
              left: 30,
              bottom: 5,
            ),
            child: Text(
              "$eventName EVENTS",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 1.2,
            color: Colors.white,
            height: 2,
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
                          top: 40,
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
                          top: 40,
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
