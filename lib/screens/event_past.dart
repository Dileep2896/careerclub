import 'package:careerclub/widgets/no_event.dart';
import 'package:flutter/material.dart';

class EventPastScreen extends StatefulWidget {
  const EventPastScreen({Key? key}) : super(key: key);

  static String id = "event_past_screen";

  @override
  State<EventPastScreen> createState() => _EventPastScreenState();
}

class _EventPastScreenState extends State<EventPastScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: Center(
          child: NoEventsWidget(
            eventName: "Past",
          ),
        ),
      ),
    );
  }
}
