import 'package:careerclub/widgets/card_icon_text.dart';
import 'package:flutter/material.dart';

import '../styles/colors.dart';

class EventsRegCard extends StatelessWidget {
  const EventsRegCard({
    Key? key,
    required this.eventName,
    required this.desc,
    required this.id,
    required this.qrScanner,
    required this.imageUrl,
    required this.showImage,
    this.resName = "Career-Club committee members",
    this.resDegisnation = "Students",
    this.eventDate = "Event Date",
    this.eventLoc = "Event Location",
    this.isPresent = false,
  }) : super(key: key);

  final String eventName;
  final String desc;
  final String resName;
  final String resDegisnation;
  final String eventDate;
  final String eventLoc;
  final bool isPresent;

  final List<dynamic> imageUrl;

  final String id;

  final Function() qrScanner;
  final Function() showImage;

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
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: showImage,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width / 4,
                            height: MediaQuery.of(context).size.height / 10,
                            child: Image.network(
                              imageUrl[0],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              eventName,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                              maxLines: 1,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            RichText(
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              strutStyle: const StrutStyle(
                                fontSize: 12.0,
                              ),
                              text: TextSpan(
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                                text: desc,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Container(
                      color: Colors.white24,
                      height: 2,
                    ),
                  ),
                  CardIconText(
                    title: resName,
                    icon: Icons.person,
                    iconSize: 20,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CardIconText(
                    title: resDegisnation,
                    icon: Icons.work,
                    iconSize: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Container(
                      color: Colors.white24,
                      height: 2,
                    ),
                  ),
                  CardIconText(
                    title: eventDate,
                    icon: Icons.calendar_month,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CardIconText(
                    title: eventLoc,
                    icon: Icons.location_on,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Container(
                      color: Colors.white24,
                      height: 2,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        isPresent ? Icons.check : Icons.close,
                        color:
                            isPresent ? Colors.greenAccent : Colors.redAccent,
                        size: 22,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Attendence",
                        style: TextStyle(
                          color:
                              isPresent ? Colors.greenAccent : Colors.redAccent,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: qrScanner,
                    icon: Icon(
                      isPresent ? null : Icons.qr_code,
                      color: Colors.white,
                      size: 22,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
