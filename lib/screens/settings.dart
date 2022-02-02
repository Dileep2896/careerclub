import 'package:flutter/material.dart';

import '../styles/colors.dart';
import '../widgets/no_event.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  static String id = "settings_screen";

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkColor,
        title: const Text(
          "Your Profile Informations",
        ),
      ),
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: Center(
          child: NoEventsWidget(
            eventName: "Settings",
          ),
        ),
      ),
    );
  }
}
