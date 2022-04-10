import 'package:careerclub/models/event_model.dart';
import 'package:careerclub/styles/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/event_card.dart';
import '../event_registration_page/event_reg_page.dart';

class EventUpcomingScreen extends StatefulWidget {
  const EventUpcomingScreen({Key? key}) : super(key: key);

  @override
  State<EventUpcomingScreen> createState() => _EventUpcomingScreenState();
}

class _EventUpcomingScreenState extends State<EventUpcomingScreen> {
  final String eventTitle = "UPCOMING";

  bool isShowImage = false;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    List<EventModel> upcomingEventsList =
        Provider.of<List<EventModel>>(context);

    return Scaffold(
      backgroundColor: primaryColor,
      body: Stack(
        children: [
          Column(
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
                  "$eventTitle EVENTS",
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
              upcomingEventsList.isEmpty
                  ? Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'images/icons/sad.png',
                            scale: 7,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "Opps, No Upcoming Events",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    )
                  : Expanded(
                      child: CarouselSlider(
                        options: CarouselOptions(
                          height: MediaQuery.of(context).size.height,
                          enableInfiniteScroll: false,
                          initialPage: 0,
                          viewportFraction: 0.75,
                          enlargeCenterPage: true,
                        ),
                        items:
                            upcomingEventsList.map<Widget>((EventModel data) {
                          int index = upcomingEventsList.indexOf(data);
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 40.0),
                            child: EventsCard(
                              id: data.id.toString(),
                              eventName: data.event!,
                              desc: data.eventDesc!,
                              imageUrls: data.imageUrls!,
                              eventDate:
                                  "${data.date!.toDate().day} - ${data.date!.toDate().month} - ${data.date!.toDate().year}",
                              eventLoc: data.eventLoc!,
                              register: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EventRegPage(
                                      eventName: data.event!,
                                      eventID: data.id!,
                                      eventDesc: data.eventDesc!,
                                      imageUrls: data.imageUrls!,
                                      eventModel: upcomingEventsList[index],
                                    ),
                                  ),
                                );
                              },
                              knowMore: () {},
                              showImage: () {
                                setState(() {
                                  isShowImage = true;
                                  index = upcomingEventsList.indexOf(data);
                                });
                              },
                            ),
                          );
                        }).toList(),
                      ),
                    ),
            ],
          ),
          upcomingEventsList.isNotEmpty
              ? isShowImage
                  ? Container(
                      padding: const EdgeInsets.all(20),
                      color: Colors.black54,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                isShowImage = false;
                              });
                            },
                            icon: const Icon(
                              Icons.close,
                              color: Colors.white,
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Image.network(
                                upcomingEventsList[index].imageUrls![0],
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container()
              : Container()
        ],
      ),
    );
  }
}
