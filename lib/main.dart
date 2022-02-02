import 'package:careerclub/screens/members.dart';
import 'package:careerclub/screens/profile.dart';
import 'package:careerclub/screens/settings.dart';
import 'package:careerclub/utils/desicion_tree.dart';
import 'package:careerclub/utils/drawer_controller.dart';
import 'package:careerclub/widgets/loading_dialog.dart';
import 'package:careerclub/screens/login.dart';
import 'package:careerclub/screens/register.dart';
import 'package:careerclub/screens/start.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MaterialApp(
    home: Center(
      child: MyApp(),
    ),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const primaryColor = Color(0xff00c2cb);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: primaryColor,
            ),
      ),
      initialRoute: DesicionTree.id,
      routes: {
        DesicionTree.id: (context) => const DesicionTree(),
        LoginScreen.id: (context) => const LoginScreen(),
        RegisterScreen.id: (context) => const RegisterScreen(),
        StartScreen.id: (context) => const StartScreen(),
        DrawerControllerScreen.id: (context) => const DrawerControllerScreen(),
        LoadingDialog.id: (context) => const LoadingDialog(),
        ProfileScreen.id: (context) => const ProfileScreen(),
        MembersInfoScreen.id: (context) => const MembersInfoScreen(),
        SettingsScreen.id: (context) => const SettingsScreen(),
      },
    );
  }
}
