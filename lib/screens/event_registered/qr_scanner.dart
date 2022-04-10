import 'dart:developer';
import 'dart:io';

import 'package:careerclub/styles/colors.dart';
import 'package:careerclub/utils/bottom_navigation.dart';
import 'package:careerclub/utils/user_actions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:fluttertoast/fluttertoast.dart';

class QRScanner extends StatefulWidget {
  const QRScanner({
    Key? key,
    required this.eventId,
    required this.eventName,
  }) : super(key: key);

  final String eventId;
  final String eventName;

  @override
  State<QRScanner> createState() => _QRScannerState();
}

class _QRScannerState extends State<QRScanner> {
  final qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  Barcode? result;
  String? eventId;
  String? eventName;

  bool qrCorrect = false;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  DocumentSnapshot? snapshot;

  @override
  void initState() {
    super.initState();
    eventId = widget.eventId;
    eventName = widget.eventName;
    getUserData().then((value) {
      setState(() {
        snapshot = value;
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
    Fluttertoast.cancel();
  }

  Future<void> registerArrayUpdate(String uid) {
    CollectionReference users = FirebaseFirestore.instance.collection('Events');
    // Call the user's CollectionReference to add a new user
    Navigator.pop(context);
    Navigator.pushReplacementNamed(context, BottomNavigationScreen.id);
    return users.doc(widget.eventId).update({
      'isPresent': [uid],
    });
  }

  Future<void> addStudent(String uid, DocumentSnapshot userData) async {
    CollectionReference registered =
        FirebaseFirestore.instance.collection('Events');
    registered
        .doc(widget.eventId)
        .collection('registered')
        .doc('attendanceInfo')
        .collection('info')
        .doc(userData.get('srn'))
        .set({
      'name': userData.get('fName'),
      'srn': userData.get('srn'),
    });

    registerArrayUpdate(uid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkColor,
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: buildQrView(context),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: result != null
                  ? Text(
                      'Data: ${result!.code}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : const Text('Scan a code'),
            ),
          )
        ],
      ),
    );
  }

  Widget buildQrView(
    BuildContext context,
  ) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 300.0
        : 400.0;

    return QRView(
      key: qrKey,
      onQRViewCreated: onQRViewCreated,
      overlay: QrScannerOverlayShape(
        borderColor: Colors.red,
        borderRadius: 10,
        borderLength: 30,
        borderWidth: 10,
        cutOutSize: scanArea,
      ),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      if (eventId != null && eventName != null) {
        if (eventId! == scanData.code) {
          if (snapshot != null) {
            addStudent(auth.currentUser!.uid, snapshot!);
            controller.dispose();
          }
        } else {
          Fluttertoast.showToast(
            msg: "Invalid QR Code, Please Try Again.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        }
      }
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }
}
