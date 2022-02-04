import 'package:careerclub/styles/colors.dart';
import 'package:careerclub/widgets/event_card.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../widgets/no_event.dart';

class EventRegisteredScreen extends StatefulWidget {
  const EventRegisteredScreen({Key? key}) : super(key: key);

  @override
  _EventRegisteredScreenState createState() => _EventRegisteredScreenState();
}

class _EventRegisteredScreenState extends State<EventRegisteredScreen> {
  int noOfCards = 1;
  String eventName = "REGISTERED";

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
                          desc:
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing softwar",
                          register: () {},
                          knowMore: () {},
                          isReg: false,
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
                          isReg: false,
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
