import 'package:flutter/material.dart';
import '../widgets/no_event.dart';

class EventRegisteredScreen extends StatefulWidget {
  const EventRegisteredScreen({Key? key}) : super(key: key);

  @override
  _EventRegisteredScreenState createState() => _EventRegisteredScreenState();
}

class _EventRegisteredScreenState extends State<EventRegisteredScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: Center(
          child: NoEventsWidget(
            eventName: "Registered",
          ),
        ),
      ),
    );
  }
}
