import 'dart:developer';

import 'package:careerclub/models/event_model.dart';
import 'package:careerclub/screens/event_registration_page/select_teachers.dart';
import 'package:careerclub/styles/colors.dart';
import 'package:careerclub/utils/extra_methods.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../widgets/loading_dialog.dart';
import '../event_registration_page/confirm_informatio.dart';

class EventRegPage extends StatefulWidget {
  const EventRegPage({
    Key? key,
    required this.eventName,
    required this.eventID,
    required this.eventDesc,
    required this.imageUrls,
    required this.eventModel,
  }) : super(key: key);

  static String id = "event_reg_page";

  final String eventID;
  final String eventName;
  final String eventDesc;
  final List imageUrls;

  final EventModel eventModel;

  @override
  State<EventRegPage> createState() => _EventRegPageState();
}

class _EventRegPageState extends State<EventRegPage> {
  Future<void> registerArrayUpdate(String uid) {
    CollectionReference users = FirebaseFirestore.instance.collection('Events');
    // Call the user's CollectionReference to add a new user
    return users.doc(widget.eventID).update({
      'registered': [uid],
    }).then((value) {
      setState(() {
        isLoading = false;
      });
      Navigator.pop(context);
    });
  }

  Future<void> addRegistered(String uid, List<String> selectedTeachers,
      DocumentSnapshot userData) async {
    CollectionReference registered =
        FirebaseFirestore.instance.collection('Events');
    for (var element in selectedTeachers) {
      registered
          .doc(widget.eventID)
          .collection('registered')
          .doc('teachersInfo')
          .collection(element)
          .doc(userData.get('srn'))
          .set({
        'name': userData.get('fName'),
        'srn': userData.get('srn'),
      });
    }
    registered
        .doc(widget.eventID)
        .collection('registered')
        .doc('teachersInfo')
        .set({'emails': selectedTeachers});
    addStudent(uid, userData);
  }

  Future<void> addStudent(String uid, DocumentSnapshot userData) async {
    CollectionReference registered =
        FirebaseFirestore.instance.collection('Events');
    registered
        .doc(widget.eventID)
        .collection('registered')
        .doc('studentsInfo')
        .collection('info')
        .doc(userData.get('srn'))
        .set({
      'name': userData.get('fName'),
      'srn': userData.get('srn'),
    });

    registerArrayUpdate(uid);
  }

  DocumentSnapshot? userData;

  String? eventName;
  String? eventDesc;

  bool isFullImage = false;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    eventName = widget.eventName;
    eventDesc = widget.eventDesc;
  }

  List<String> selectedTeachers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkColor,
      appBar: AppBar(
        backgroundColor: darkColor,
        elevation: 0,
        title: const Text("Register"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        isFullImage = true;
                      });
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 5,
                        child: Image.network(
                          widget.imageUrls[0],
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 3,
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "$eventName",
                        style: const TextStyle(
                          color: primaryColor,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "$eventDesc",
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        maxLines: 5,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          "Know More",
                          style: TextStyle(
                            color: Colors.yellowAccent.shade700,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 3,
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                ConfirmInformation(
                  userData: (value) {
                    setState(() {
                      userData = value;
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 3,
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                SelectTeachers(
                  eventModel: widget.eventModel,
                  onSelectedTeacher: (List<String> selectedTeachers) {
                    this.selectedTeachers = selectedTeachers;
                    log(this.selectedTeachers.toString());
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      // registerArrayUpdate(
                      //     eventName!, FirebaseAuth.instance.currentUser!.uid);
                      if (selectedTeachers.isNotEmpty &&
                          !selectedTeachers.contains('select')) {
                        setState(() {
                          isLoading = true;
                        });
                        addRegistered(
                          FirebaseAuth.instance.currentUser!.uid,
                          selectedTeachers,
                          userData!,
                        );
                      } else {
                        snackBar(context, 'Please Select All The Teachers');
                      }
                    },
                    child: const Text("Register"),
                  ),
                ),
              ],
            ),
          ),
          isLoading ? const LoadingDialog() : Container(),
          isFullImage
              ? Container(
                  padding: const EdgeInsets.all(10),
                  color: Colors.black38,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          icon: const Icon(Icons.close),
                          color: Colors.white,
                          onPressed: () {
                            setState(() {
                              isFullImage = false;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: Image.network(
                          widget.imageUrls[0],
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
