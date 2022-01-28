import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../screens/members_complete_info.dart';
import 'loading_dialog.dart';
import 'member_card.dart';

// ignore: must_be_immutable
class MemberStreamBuilder extends StatelessWidget {
  MemberStreamBuilder({
    Key? key,
    required this.studentDocName,
    required this.stream,
    required this.isProf,
  }) : super(key: key);

  final String studentDocName;
  final Stream<QuerySnapshot> stream;
  bool isProf;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: StreamBuilder(
        stream: stream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingDialog();
          }
          return Padding(
            padding: const EdgeInsets.only(
              left: 15.0,
              right: 15.0,
              top: 10.0,
            ),
            child: ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data() as Map<String, dynamic>;
                return MembersCard(
                  name: data["name"],
                  title: data["title"],
                  image: 'images/' + data['image'],
                  onPressed: () async {
                    final bool? result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MembersCompleteInfo(
                          memberId: document.id,
                          docName: studentDocName,
                          isProfs: isProf,
                        ),
                      ),
                    );
                    if (result!) {
                      Fluttertoast.showToast(
                        msg:
                            "Something Went Wrong, Please Try Again or Check your Internet Connection",
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 2,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 14.0,
                      );
                    }
                  },
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}
