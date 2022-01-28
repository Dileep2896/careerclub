import 'package:flutter/material.dart';

import '../screens/drawer.dart';
import 'bottom_navigation.dart';

class DrawerControllerScreen extends StatefulWidget {
  const DrawerControllerScreen({Key? key}) : super(key: key);

  static String id = "drawer_controller";

  @override
  State<DrawerControllerScreen> createState() => _DrawerControllerScreenState();
}

class _DrawerControllerScreenState extends State<DrawerControllerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const [
          DrawerScreen(),
          BottomNavigationScreen(),
        ],
      ),
    );
  }
}
