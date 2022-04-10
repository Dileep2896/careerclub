import 'package:careerclub/models/event_model.dart';
import 'package:careerclub/models/teachers_data_model.dart';
import 'package:careerclub/models/user_data_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DataBase {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<EventModel>> upcomingEvents(String uid) {
    return _firestore
        .collection('Events')
        .where("registered", isNotEqualTo: [uid])
        .snapshots()
        .map(
          (list) =>
              list.docs.map((docs) => EventModel.fromMap(docs.data())).toList(),
        );
  }

  Stream<List<EventModel>> registeredEvents(String uid) {
    return _firestore
        .collection('Events')
        .where("registered", isEqualTo: [uid])
        .snapshots()
        .map(
          (list) =>
              list.docs.map((docs) => EventModel.fromMap(docs.data())).toList(),
        );
  }

  Stream<List<TeacherDataModel>> teacherDatas() {
    return _firestore.collection('TeacherData').snapshots().map((list) => list
        .docs
        .map((docs) => TeacherDataModel.fromMap(docs.data()))
        .toList());
  }

  Stream<UserDataModel> userData(String uid) {
    return _firestore
        .collection('UserData')
        .doc(uid)
        .snapshots()
        .map((snap) => UserDataModel.fromMap(snap.data()!));
  }
}
