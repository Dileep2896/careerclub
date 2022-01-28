import 'package:careerclub/utils/desicion_tree.dart';
import 'package:careerclub/widgets/loading_dialog.dart';
import 'package:careerclub/widgets/rounded_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../styles/colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  static String id = 'profile_screen';

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String uid = FirebaseAuth.instance.currentUser!.uid;
  DocumentSnapshot? documentSnapshot;

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection('UserData')
        .doc(uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        // ignore: avoid_print
        print(documentSnapshot.get('phoneNumber'));
        setState(() {
          this.documentSnapshot = documentSnapshot;
          _isLoading = false;
        });
      } else {
        // ignore: avoid_print
        print('Document does not exist on the database');
        setState(() {
          _isLoading = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const LoadingDialog()
        : Scaffold(
            body: SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 200.0,
                      child: Image.asset(
                        "images/logo.png",
                      ),
                    ),
                    const SizedBox(
                      height: 20,
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
                    RoundedButton(
                      onPressed: () async {
                        await FirebaseAuth.instance.signOut();
                        Navigator.pushReplacementNamed(
                            context, DesicionTree.id);
                      },
                      color: Colors.redAccent,
                      title: "Logout",
                      titleColor: Colors.white,
                    )
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
