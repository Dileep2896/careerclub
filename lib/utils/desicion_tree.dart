import 'package:careerclub/screens/start.dart';
import 'package:careerclub/utils/bottom_navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../database/db.dart';
import '../models/user_data_model.dart';

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
    return StreamProvider<UserDataModel>.value(
      value: DataBase().userData(FirebaseAuth.instance.currentUser!.uid),
      initialData: UserDataModel(),
      child: const BottomNavigationScreen(),
    );
  }
}
