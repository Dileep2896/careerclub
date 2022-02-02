import 'package:careerclub/utils/user_actions.dart';
import 'package:careerclub/widgets/loading_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../styles/colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  static String id = 'profile_screen';

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  DocumentSnapshot? documentSnapshot;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    Future<DocumentSnapshot<Object?>?> documentSnapshot = getUserData();
    documentSnapshot.then(
      (value) => {
        if (value != null)
          {
            setState(() {
              this.documentSnapshot = value;
              _isLoading = false;
            })
          }
        else
          {
            setState(() {
              _isLoading = true;
            })
          }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const LoadingDialog()
        : Scaffold(
            appBar: AppBar(
              backgroundColor: darkColor,
              title: const Text(
                "Your Profile Informations",
              ),
            ),
            backgroundColor: darkColor,
            body: SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 250.0,
                      child: Image.asset(
                        "images/career_club_logo.png",
                      ),
                    ),
                    InfoContainer(
                      subject: "Name",
                      information: documentSnapshot!.get('fName'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InfoContainer(
                      subject: "Reva Mail",
                      information: documentSnapshot?.get('revaMail'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InfoContainer(
                      subject: "SRN",
                      information: documentSnapshot?.get('srn'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InfoContainer(
                      subject: "Phone Number",
                      information: documentSnapshot?.get('phoneNumber'),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                            primary: Colors.yellowAccent,
                          ),
                          onPressed: () {},
                          child: const Text(
                            "Edit Profile",
                          ),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            primary: Colors.redAccent,
                          ),
                          onPressed: () {},
                          child: const Text(
                            "Delete Account",
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}

// ignore: must_be_immutable
class InfoContainer extends StatelessWidget {
  InfoContainer({
    Key? key,
    required this.information,
    required this.subject,
  }) : super(key: key);

  String information;
  String subject;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.3,
      height: 50,
      decoration: BoxDecoration(
        color: primaryColor,
        border: Border.all(
          color: primaryColor,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Center(
        child: Text(
          information,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
