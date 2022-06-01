// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomePageController on _HomePageControllerBase, Store {
  late final _$allEventsAtom =
      Atom(name: '_HomePageControllerBase.allEvents', context: context);

  @override
  ObservableList<Event> get allEvents {
    _$allEventsAtom.reportRead();
    return super.allEvents;
  }

  @override
  set allEvents(ObservableList<Event> value) {
    _$allEventsAtom.reportWrite(value, super.allEvents, () {
      super.allEvents = value;
    });
  }

  late final _$selectedDayAtom =
      Atom(name: '_HomePageControllerBase.selectedDay', context: context);

  @override
  DateTime? get selectedDay {
    _$selectedDayAtom.reportRead();
    return super.selectedDay;
  }

  @override
  set selectedDay(DateTime? value) {
    _$selectedDayAtom.reportWrite(value, super.selectedDay, () {
      super.selectedDay = value;
    });
  }

  late final _$calendarFormatAtom =
      Atom(name: '_HomePageControllerBase.calendarFormat', context: context);

  @override
  CalendarFormat get calendarFormat {
    _$calendarFormatAtom.reportRead();
    return super.calendarFormat;
  }

  @override
  set calendarFormat(CalendarFormat value) {
    _$calendarFormatAtom.reportWrite(value, super.calendarFormat, () {
      super.calendarFormat = value;
    });
  }

  late final _$focusedDayAtom =
      Atom(name: '_HomePageControllerBase.focusedDay', context: context);

  @override
  DateTime get focusedDay {
    _$focusedDayAtom.reportRead();
    return super.focusedDay;
  }

  @override
  set focusedDay(DateTime value) {
    _$focusedDayAtom.reportWrite(value, super.focusedDay, () {
      super.focusedDay = value;
    });
  }

  late final _$selectedDaysAtom =
      Atom(name: '_HomePageControllerBase.selectedDays', context: context);

  @override
  ObservableSet<DateTime> get selectedDays {
    _$selectedDaysAtom.reportRead();
    return super.selectedDays;
  }

  @override
  set selectedDays(ObservableSet<DateTime> value) {
    _$selectedDaysAtom.reportWrite(value, super.selectedDays, () {
      super.selectedDays = value;
    });
  }

  late final _$kFirstDayAtom =
      Atom(name: '_HomePageControllerBase.kFirstDay', context: context);

  @override
  DateTime? get kFirstDay {
    _$kFirstDayAtom.reportRead();
    return super.kFirstDay;
  }

  @override
  set kFirstDay(DateTime? value) {
    _$kFirstDayAtom.reportWrite(value, super.kFirstDay, () {
      super.kFirstDay = value;
    });
  }

  late final _$kLastDayAtom =
      Atom(name: '_HomePageControllerBase.kLastDay', context: context);

  @override
  DateTime? get kLastDay {
    _$kLastDayAtom.reportRead();
    return super.kLastDay;
  }

  @override
  set kLastDay(DateTime? value) {
    _$kLastDayAtom.reportWrite(value, super.kLastDay, () {
      super.kLastDay = value;
    });
  }

  late final _$timestampAtom =
      Atom(name: '_HomePageControllerBase.timestamp', context: context);

  @override
  Timestamp? get timestamp {
    _$timestampAtom.reportRead();
    return super.timestamp;
  }

  @override
  set timestamp(Timestamp? value) {
    _$timestampAtom.reportWrite(value, super.timestamp, () {
      super.timestamp = value;
    });
  }

  late final _$filteredEventsByDateAtom = Atom(
      name: '_HomePageControllerBase.filteredEventsByDate', context: context);

  @override
  ObservableList<Event> get filteredEventsByDate {
    _$filteredEventsByDateAtom.reportRead();
    return super.filteredEventsByDate;
  }

  @override
  set filteredEventsByDate(ObservableList<Event> value) {
    _$filteredEventsByDateAtom.reportWrite(value, super.filteredEventsByDate,
        () {
      super.filteredEventsByDate = value;
    });
  }

  late final _$titleAtom =
      Atom(name: '_HomePageControllerBase.title', context: context);

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  late final _$populateEventsAsyncAction =
      AsyncAction('_HomePageControllerBase.populateEvents', context: context);

  @override
  Future<void> populateEvents() {
    return _$populateEventsAsyncAction.run(() => super.populateEvents());
  }

  late final _$addEventFirestoreAsyncAction = AsyncAction(
      '_HomePageControllerBase.addEventFirestore',
      context: context);

  @override
  Future<void> addEventFirestore(Timestamp date) {
    return _$addEventFirestoreAsyncAction
        .run(() => super.addEventFirestore(date));
  }

  late final _$logoutAsyncAction =
      AsyncAction('_HomePageControllerBase.logout', context: context);

  @override
  Future<Resource<void, String>> logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  late final _$_HomePageControllerBaseActionController =
      ActionController(name: '_HomePageControllerBase', context: context);

  @override
  void setCalendarFormat(CalendarFormat format) {
    final _$actionInfo = _$_HomePageControllerBaseActionController.startAction(
        name: '_HomePageControllerBase.setCalendarFormat');
    try {
      return super.setCalendarFormat(format);
    } finally {
      _$_HomePageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFirstSelectedDay() {
    final _$actionInfo = _$_HomePageControllerBaseActionController.startAction(
        name: '_HomePageControllerBase.setFirstSelectedDay');
    try {
      return super.setFirstSelectedDay();
    } finally {
      _$_HomePageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDateTimeToTimestamp() {
    final _$actionInfo = _$_HomePageControllerBaseActionController.startAction(
        name: '_HomePageControllerBase.setDateTimeToTimestamp');
    try {
      return super.setDateTimeToTimestamp();
    } finally {
      _$_HomePageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onDaySelected(DateTime selectedDay, DateTime today) {
    final _$actionInfo = _$_HomePageControllerBaseActionController.startAction(
        name: '_HomePageControllerBase.onDaySelected');
    try {
      return super.onDaySelected(selectedDay, today);
    } finally {
      _$_HomePageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  List<Event> eventLoader(DateTime date) {
    final _$actionInfo = _$_HomePageControllerBaseActionController.startAction(
        name: '_HomePageControllerBase.eventLoader');
    try {
      return super.eventLoader(date);
    } finally {
      _$_HomePageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void loadEventsByTimestamp(DateTime date) {
    final _$actionInfo = _$_HomePageControllerBaseActionController.startAction(
        name: '_HomePageControllerBase.loadEventsByTimestamp');
    try {
      return super.loadEventsByTimestamp(date);
    } finally {
      _$_HomePageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeTitle(String newValue) {
    final _$actionInfo = _$_HomePageControllerBaseActionController.startAction(
        name: '_HomePageControllerBase.changeTitle');
    try {
      return super.changeTitle(newValue);
    } finally {
      _$_HomePageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
allEvents: ${allEvents},
selectedDay: ${selectedDay},
calendarFormat: ${calendarFormat},
focusedDay: ${focusedDay},
selectedDays: ${selectedDays},
kFirstDay: ${kFirstDay},
kLastDay: ${kLastDay},
timestamp: ${timestamp},
filteredEventsByDate: ${filteredEventsByDate},
title: ${title}
    ''';
  }
}
