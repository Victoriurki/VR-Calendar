import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
  String? title;
  Timestamp? date;

  Event({this.date, this.title});

  @override
  String toString() => title!;

  factory Event.fromMap(Map<String, dynamic> map) {
    return Event(date: map["date"], title: map["title"]);
  }
}
