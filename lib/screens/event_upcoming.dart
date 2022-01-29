import 'package:careerclub/widgets/no_event.dart';
import 'package:flutter/material.dart';

class EventUpcomingScreen extends StatefulWidget {
  const EventUpcomingScreen({Key? key}) : super(key: key);

  @override
  _EventUpcomingScreenState createState() => _EventUpcomingScreenState();
}

class _EventUpcomingScreenState extends State<EventUpcomingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: Center(
          child: NoEventsWidget(
            eventName: "Upcoming",
          ),
        ),
      ),
    );
  }
}
