import 'package:careerclub/components/desicion_tree.dart';
import 'package:careerclub/components/loading_dialog.dart';
import 'package:careerclub/screens/bottom_navigation.dart';
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
        BottomNavigationScreen.id: (context) => const BottomNavigationScreen(),
        LoadingDialog.id: (context) => const LoadingDialog(),
      },
    );
  }
}