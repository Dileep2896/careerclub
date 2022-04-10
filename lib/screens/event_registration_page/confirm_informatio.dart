import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../utils/user_actions.dart';
import '../../widgets/card_icon_text.dart';

class ConfirmInformation extends StatefulWidget {
  const ConfirmInformation({Key? key, this.userData}) : super(key: key);

  final Function(DocumentSnapshot data)? userData;

  @override
  State<ConfirmInformation> createState() => _ConfirmInformationState();
}

class _ConfirmInformationState extends State<ConfirmInformation> {
  bool _isLoading = true;
  DocumentSnapshot? documentSnapshot;

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
              widget.userData!(value);
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
        ? const CircularProgressIndicator()
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    "Please Confirm Your Information",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      CardIconText(
                        title: documentSnapshot!.get('fName'),
                        icon: Icons.person,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CardIconText(
                        title: documentSnapshot?.get('srn'),
                        icon: Icons.card_travel,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CardIconText(
                        title: documentSnapshot?.get('revaMail'),
                        icon: Icons.mail,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const CardIconText(
                        title: "CSE  |  6th B",
                        icon: Icons.home,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}
