import 'package:careerclub/widgets/card_icon_text.dart';
import 'package:flutter/material.dart';

import '../styles/colors.dart';

class EventsCard extends StatelessWidget {
  const EventsCard({
    Key? key,
    required this.eventName,
    required this.desc,
    required this.register,
    required this.knowMore,
    required this.id,
    required this.imageUrls,
    required this.showImage,
    this.resName = "Resource Person Name",
    this.resDegisnation = "Degisnation",
    this.eventDate = "Event Date",
    this.eventLoc = "Event Location",
  }) : super(key: key);

  final String eventName;
  final String desc;
  final String resName;
  final String resDegisnation;
  final String eventDate;
  final String eventLoc;
  final List<dynamic> imageUrls;

  final String id;

  final Function() register;
  final Function() knowMore;
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
            Column(
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
                            imageUrls[0],
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
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          RichText(
                            maxLines: 4,
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
              ],
            ),
            Row(
              children: [
                TextButton(
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
    );
  }
}
