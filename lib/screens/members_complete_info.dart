import 'package:careerclub/components/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../components/loading_dialog.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
        backgroundColor: primaryColor,
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
                    decoration: BoxDecoration(
                      color: secondaryColor,
                      border: Border.all(
                        color: secondaryColor,
                      ),
                      borderRadius: const BorderRadius.all(
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

// ignore: must_be_immutable
class InfoContainer extends StatelessWidget {
  InfoContainer({
    Key? key,
    required this.information,
    required this.subject,
    this.fontSize = 16,
  }) : super(key: key);

  String information;
  String subject;
  double fontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.6,
      decoration: BoxDecoration(
        color: primaryColor,
        border: Border.all(
          color: primaryColor,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            information,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: fontSize,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
