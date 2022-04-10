import 'package:careerclub/styles/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../widgets/member_stream_builder.dart';

const String studentDocName = 'Members';
const String profDocName = 'Prof_Members';

class MembersInfoScreen extends StatefulWidget {
  const MembersInfoScreen({Key? key}) : super(key: key);

  static String id = "member_info_screen";

  @override
  _MembersInfoScreenState createState() => _MembersInfoScreenState();
}

class _MembersInfoScreenState extends State<MembersInfoScreen> {
  final Stream<QuerySnapshot> _studentsStream =
      FirebaseFirestore.instance.collection(studentDocName).snapshots();

  final Stream<QuerySnapshot> _profStream =
      FirebaseFirestore.instance.collection(profDocName).snapshots();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          backgroundColor: darkColor,
          title: const Text(
            "Meet Our Team",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                text: "Students",
              ),
              Tab(
                text: "Professors",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            MemberStreamBuilder(
              studentDocName: studentDocName,
              stream: _studentsStream,
              isProf: false,
            ),
            MemberStreamBuilder(
              studentDocName: profDocName,
              stream: _profStream,
              isProf: true,
            ),
          ],
        ),
      ),
    );
  }
}
