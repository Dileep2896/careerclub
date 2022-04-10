import 'package:careerclub/styles/colors.dart';
import 'package:careerclub/widgets/event_reg_card.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../models/event_model.dart';
import '../../utils/user_actions.dart';

class EventRegisteredScreen extends StatefulWidget {
  const EventRegisteredScreen({Key? key}) : super(key: key);

  @override
  State<EventRegisteredScreen> createState() => _EventRegisteredScreenState();
}

class _EventRegisteredScreenState extends State<EventRegisteredScreen> {
  final String eventTitle = "REGISTERED";

  bool isShowQR = false;
  bool isShowImage = false;

  int index = 0;
  String userId = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    List<EventModel> registeredEventsList =
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
              registeredEventsList.isEmpty
                  ? Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Opps, You Haven't Registered\nFor Any Events\n\nClick on '+' button to register for an event",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white70,
                            ),
                            textAlign: TextAlign.center,
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
                            registeredEventsList.map<Widget>((EventModel data) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 40.0),
                            child: EventsRegCard(
                                id: data.id!,
                                eventName: data.event!,
                                desc: data.eventDesc!,
                                imageUrl: data.imageUrls!,
                                eventDate:
                                    "${data.date!.toDate().day} - ${data.date!.toDate().month} - ${data.date!.toDate().year}",
                                eventLoc: data.eventLoc!,
                                isPresent: data.isPresent != null
                                    ? getAttendance(
                                        data.isPresent, auth.currentUser!.uid)
                                    : false,
                                qrScanner: () {
                                  setState(() {
                                    isShowQR = true;
                                    index = registeredEventsList.indexOf(data);
                                  });
                                },
                                showImage: () {
                                  setState(() {
                                    isShowImage = true;
                                    index = registeredEventsList.indexOf(data);
                                  });
                                }),
                          );
                        }).toList(),
                      ),
                    ),
            ],
          ),
          isShowQR
              ? registeredEventsList.isNotEmpty
                  ? Container(
                      color: Colors.black54,
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                isShowQR = false;
                              });
                            },
                            icon: const Icon(
                              Icons.close,
                              color: Colors.white,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  QrImage(
                                    data: registeredEventsList[index].id! +
                                        userId,
                                    version: QrVersions.auto,
                                  ),
                                  Text(
                                    registeredEventsList[index].id! + userId,
                                    style: const TextStyle(
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : const Text("Loading")
              : Container(),
          registeredEventsList.isNotEmpty
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
                                registeredEventsList[index].imageUrls![0],
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container()
              : Container(),
        ],
      ),
    );
  }

  bool getAttendance(data, String uid) {
    for (int i = 0; i < data.length; i++) {
      if (uid == data[i]) {
        return true;
      } else {
        return false;
      }
    }
    return false;
  }
}
