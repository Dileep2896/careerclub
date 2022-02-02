import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../styles/colors.dart';
import '../widgets/loading_dialog.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/member_info_container.dart';

// ignore: must_be_immutable
class MembersCompleteInfo extends StatefulWidget {
  MembersCompleteInfo({
    Key? key,
    required this.memberId,
    required this.docName,
    required this.isProfs,
  }) : super(key: key);

  static String id = "member_complete_info_screen";

  String memberId;
  String docName;
  bool isProfs;

  @override
  _MembersCompleteInfoState createState() => _MembersCompleteInfoState();
}

class _MembersCompleteInfoState extends State<MembersCompleteInfo> {
  DocumentSnapshot? documentSnapshot;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection(widget.docName)
        .doc(widget.memberId)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        // ignore: avoid_print
        print(documentSnapshot.get('name'));
        setState(() {
          this.documentSnapshot = documentSnapshot;
          isLoading = false;
        });
      } else {
        // ignore: avoid_print
        print('Document does not exist on the database');
        setState(() {
          isLoading = true;
          Navigator.pop(context, true);
        });
      }
    });
  }

  // final String _url = 'https://www.instagram.com/dileep_sharma_a/';

  // void _launchURL() async {
  //   if (!await launch(_url)) throw 'Could not launch $_url';
  // }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const LoadingDialog();
    } else {
      return Scaffold(
        backgroundColor: darkColor,
        body: SafeArea(
          child: Column(
            children: [
              Flexible(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context, false);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                      ),
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 20,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 30.0,
                    horizontal: 30,
                  ),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: SizedBox(
                            height: 150.0,
                            child: Image.asset(
                              "images/" + documentSnapshot!.get('image'),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        InfoContainer(
                          subject: "Name",
                          information: documentSnapshot!.get('title'),
                          fontSize: 20,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        InfoContainer(
                          subject: "Title",
                          information: documentSnapshot!.get('name'),
                          fontSize: 18,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        widget.isProfs
                            ? const SizedBox(
                                width: 0,
                                height: 0,
                              )
                            : InfoContainer(
                                subject: "Sem and Sec",
                                information: documentSnapshot!.get('sem'),
                                fontSize: 18,
                              ),
                        const SizedBox(
                          height: 20,
                        ),
                        widget.isProfs
                            ? const SizedBox(
                                width: 0,
                                height: 0,
                              )
                            : InfoContainer(
                                subject: "mail",
                                information: documentSnapshot!.get('mail'),
                                fontSize: 14,
                              ),
                        const SizedBox(
                          height: 20,
                        ),
                        Material(
                          type: MaterialType.transparency,
                          child: Container(
                            color: Colors.white,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  splashColor: Colors.pinkAccent.shade100,
                                  splashRadius: 18,
                                  onPressed: () {
                                    // _launchURL();
                                  },
                                  icon: const Icon(
                                    FontAwesomeIcons.instagram,
                                    color: Colors.pinkAccent,
                                  ),
                                ),
                                IconButton(
                                  splashRadius: 18,
                                  splashColor: Colors.blueAccent.shade100,
                                  onPressed: () {},
                                  icon: const Icon(
                                    FontAwesomeIcons.linkedin,
                                    color: Colors.blueAccent,
                                  ),
                                ),
                                IconButton(
                                  splashRadius: 18,
                                  splashColor: Colors.black12,
                                  onPressed: () {},
                                  icon: const Icon(
                                    FontAwesomeIcons.github,
                                    color: Colors.black,
                                  ),
                                ),
                                IconButton(
                                  splashRadius: 18,
                                  splashColor: Colors.blue.shade100,
                                  onPressed: () {},
                                  icon: const Icon(
                                    FontAwesomeIcons.facebook,
                                    color: Colors.blue,
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
