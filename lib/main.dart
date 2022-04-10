import 'package:careerclub/database/db.dart';
import 'package:careerclub/models/teachers_data_model.dart';
import 'package:careerclub/screens/members_and_about/members.dart';
import 'package:careerclub/screens/members_and_about/profile.dart';
import 'package:careerclub/screens/settings.dart';
import 'package:careerclub/utils/bottom_navigation.dart';
import 'package:careerclub/utils/desicion_tree.dart';
import 'package:careerclub/widgets/loading_dialog.dart';
import 'package:careerclub/screens/authentication/login.dart';
import 'package:careerclub/screens/authentication/register.dart';
import 'package:careerclub/screens/start.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    const MaterialApp(
      home: MyApp(),
    ),
  );
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
    return MultiProvider(
      providers: [
        StreamProvider<List<TeacherDataModel>>.value(
          value: DataBase().teacherDatas(),
          initialData: const [],
        ),
      ],
      child: MaterialApp(
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
          LoadingDialog.id: (context) => const LoadingDialog(),
          ProfileScreen.id: (context) => const ProfileScreen(),
          MembersInfoScreen.id: (context) => const MembersInfoScreen(),
          SettingsScreen.id: (context) => const SettingsScreen(),
          BottomNavigationScreen.id: (context) =>
              const BottomNavigationScreen(),
        },
      ),
    );
  }
}
