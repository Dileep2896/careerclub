import 'package:careerclub/screens/start.dart';
import 'package:careerclub/utils/drawer_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DesicionTree extends StatefulWidget {
  const DesicionTree({Key? key}) : super(key: key);

  static String id = 'desicion_tree';

  @override
  _DesicionTreeState createState() => _DesicionTreeState();
}

class _DesicionTreeState extends State<DesicionTree> {
  User? user;

  @override
  void initState() {
    super.initState();
    onRefresh(FirebaseAuth.instance.currentUser);
  }

  onRefresh(userCred) {
    setState(() {
      user = userCred;
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_null_comparison
    if (user == null) {
      return const StartScreen();
    }
    return const DrawerControllerScreen();
  }
}
