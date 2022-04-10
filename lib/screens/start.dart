import 'package:careerclub/widgets/rounded_button.dart';
import 'package:careerclub/screens/authentication/login.dart';
import 'package:careerclub/screens/authentication/register.dart';
import 'package:flutter/material.dart';

import '../styles/colors.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  static String id = 'start_screen';

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Hero(
              tag: "logo",
              child: Image.asset(
                'images/logo.png',
                width: MediaQuery.of(context).size.width / 2.5,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 16.0, top: 20.0),
              child: Text(
                "Hi, Welcome To Reva Career Club",
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.3,
              child: RoundedButton(
                onPressed: () {
                  Navigator.pushNamed(context, RegisterScreen.id);
                },
                color: primaryColor,
                title: "Get Started",
                titleColor: Colors.white,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.3,
              child: RoundedButton(
                onPressed: () {
                  Navigator.pushNamed(context, LoginScreen.id);
                },
                color: Colors.grey.shade200,
                title: "I already have an account",
                titleColor: primaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
