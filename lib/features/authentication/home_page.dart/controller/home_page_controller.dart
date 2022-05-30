import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../core/generics/get_hashcode.dart';
import '../../../../core/models/event_model.dart';
part 'home_page_controller.g.dart';

class HomePageController = _HomePageControllerBase with _$HomePageController;

abstract class _HomePageControllerBase with Store {
  @observable
  ObservableList<Event> allEvents = <Event>[].asObservable();

  @observable
  DateTime? selectedDay;

  @observable
  CalendarFormat calendarFormat = CalendarFormat.month;

  @action
  void setCalendarFormat(CalendarFormat format) => calendarFormat = format;

  @observable
  DateTime focusedDay = DateTime.now();

  @observable
  ObservableSet<DateTime> selectedDays = LinkedHashSet<DateTime>(
    equals: isSameDay,
    hashCode: getHashCode,
  ).asObservable();

  @observable
  DateTime? kFirstDay;

  @observable
  DateTime? kLastDay;

  @observable
  Timestamp? timestamp;

  @action
  void setFirstSelectedDay() {}

  @action
  void setDateTimeToTimestamp() {
    selectedDay = DateTime.now();
    timestamp = Timestamp.fromDate(selectedDay!);
  }

  @action
  void onDaySelected(DateTime selectedDay, DateTime today) {
    this.selectedDay = selectedDay;
    focusedDay = today;

    if (selectedDays.contains(selectedDay)) {
      selectedDays.remove(selectedDay);
    } else {
      selectedDays.add(selectedDay);
      loadEventsByTimestamp(selectedDay);
    }
  }

  @observable
  ObservableList<Event> filteredEventsByDate = <Event>[].asObservable();

  @action
  List<Event> eventLoader(DateTime day) {
    return allEvents
        .where((element) => element.date!.toDate().day == day.day)
        .toList();
  }

  @action
  Future<void> populateEvents() async {
    var currentUser = FirebaseAuth.instance.currentUser!.uid;
    var userEvents = await FirebaseFirestore.instance
        .collection('users')
        .doc('$currentUser')
        .collection('events')
        .get();
    //transformo de querySnapshot em Lista
    final eventList = userEvents.docs.map((e) => e.data()).toList();
    //lista<map> em lista<event>
    final eventModelList = eventList.map((e) => Event.fromMap(e)).toList();
    allEvents = eventModelList.asObservable();
  }

  @action
  void loadEventsByTimestamp(DateTime date) {
    filteredEventsByDate.clear();
    for (final event in allEvents) {
      final eventDateTime = event.date!.toDate();
      print(eventDateTime.day + eventDateTime.month);
      if (eventDateTime.day == date.day &&
          eventDateTime.month == date.month &&
          eventDateTime.year == date.year) {
        filteredEventsByDate.add(event);
      }
    }
  }

  @observable
  String title = '';

  @action
  void changeTitle(String newValue) => title = newValue;

  @action
  Future<void> addEventFirestore(Timestamp date) async {
    var currentUser = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance
        .collection("users")
        .doc('$currentUser')
        .collection('events')
        .doc()
        .set({
      "title": title,
      "date": date,
    });
  }
}
