import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore store = FirebaseFirestore.instance;

Future<String?> registerUser(
    {required String revaMail,
    required String rePassword,
    String? name,
    String? srn,
    String? phoneNumber}) async {
  try {
    await auth
        .createUserWithEmailAndPassword(email: revaMail, password: rePassword)
        .then((value) {
      FirebaseFirestore.instance
          .collection('UserData')
          .doc(value.user!.uid)
          .set({
        'fName': name,
        'srn': srn,
        'phoneNumber': phoneNumber,
        'revaMail': revaMail,
        'password': rePassword
      });
    });
    return null;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      // ignore: avoid_print
      print('The password provided is too weak.');
      return e.message;
    } else if (e.code == 'email-already-in-use') {
      // ignore: avoid_print
      print('The account already exists for that email.');
      return e.message;
    }
    // ignore: avoid_print
    print(e.code);
    return e.message;
  } catch (e) {
    // ignore: avoid_print
    print(e);
    return 'error';
  }
}

Future<String?> login(
    {required String revaMail, required String password}) async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: revaMail,
      password: password,
    );
    return null;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      // ignore: avoid_print
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      // ignore: avoid_print
      print('Wrong password provided for that user.');
    }
    return e.message;
  }
}

Future<DocumentSnapshot?> getUserData() async {
  String uid = FirebaseAuth.instance.currentUser!.uid;
  DocumentSnapshot? documentSnapshots;
  await FirebaseFirestore.instance
      .collection('UserData')
      .doc(uid)
      .get()
      .then((DocumentSnapshot documentSnapshot) {
    if (documentSnapshot.exists) {
      // ignore: avoid_print
      documentSnapshots = documentSnapshot;
    } else {
      // ignore: avoid_print
      documentSnapshots = null;
    }
  });
  return documentSnapshots;
}

Future<String> downloadURL() async {
  String downloadURL = await firebase_storage.FirebaseStorage.instance
      .ref('test/buymeacoffee.jpeg')
      .getDownloadURL();

  return downloadURL;
}

Future getEventsData(String uid) async {
  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('Events')
      .where("registered", isNotEqualTo: [uid]).get();
  return snapshot.docs;
}

Future getRegEventsData(String uid) async {
  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('Events')
      .where("registered", isEqualTo: [uid]).get();
  return snapshot.docs;
}
