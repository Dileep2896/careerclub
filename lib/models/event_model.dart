import 'package:cloud_firestore/cloud_firestore.dart';

class EventModel {
  final Timestamp? date;
  final String? event;
  final String? eventDesc;
  final String? eventLoc;
  final String? id;
  final List<dynamic>? imageUrls;
  final List<dynamic>? isPresent;
  final List<dynamic>? periods;
  final List<dynamic>? registered;
  final String? resPersonName;
  final String? resPersonDeg;

  EventModel({
    this.date,
    this.event,
    this.eventDesc,
    this.eventLoc,
    this.id,
    this.imageUrls,
    this.isPresent,
    this.periods,
    this.registered,
    this.resPersonDeg,
    this.resPersonName,
  });

  factory EventModel.fromMap(Map data) {
    return EventModel(
      date: data['date'] ?? '',
      event: data['event'] ?? '',
      eventDesc: data['eventDesc'] ?? '',
      eventLoc: data['eventLoc'] ?? '',
      id: data['id'] ?? '',
      imageUrls: data['imageUrls'] ?? [],
      isPresent: data['isPresent'] ?? [],
      periods: data['periods'] ?? [],
      registered: data['registered'] ?? [],
      resPersonDeg: data['resPersonDeg'] ?? '',
      resPersonName: data['resPersonName'] ?? '',
    );
  }
}
