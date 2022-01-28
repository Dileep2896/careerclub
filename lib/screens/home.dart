import 'package:careerclub/components/constants.dart';
import 'package:careerclub/components/custom_app_bar.dart';
import 'package:flutter/material.dart';

import '../components/previous_event.dart';
import '../components/registered_event.dart';
import '../components/upcoming_events.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor,
      child: SafeArea(
        child: Container(
          color: Colors.grey.shade100,
          child: Column(
            children: const [
              CustomAppBar(),
              UpcomingEvents(),
              RegisteredEvent(),
              PreviousEvent(),
            ],
          ),
        ),
      ),
    );
  }
}
