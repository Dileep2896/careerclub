import 'package:flutter/material.dart';

import '../styles/colors.dart';

class UpdatesScreen extends StatefulWidget {
  const UpdatesScreen({Key? key}) : super(key: key);

  @override
  _UpdatesScreenState createState() => _UpdatesScreenState();
}

class _UpdatesScreenState extends State<UpdatesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width / 1.3,
            height: 80,
            decoration: BoxDecoration(
              color: primaryColor,
              border: Border.all(
                color: primaryColor,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: const Center(
              child: Text(
                "Updates Not Available",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
