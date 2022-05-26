import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../core/generics/get_hashcode.dart';
import '../../../../core/models/event_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late DateTime kToday;
  late DateTime kFirstDay;
  late DateTime kLastDay;
  late Map<DateTime, List<Event>> kEvents;
  final ValueNotifier<DateTime> _focusedDay = ValueNotifier(
    DateTime.now(),
  );
  final Set<DateTime> _selectedDays = LinkedHashSet<DateTime>(
    equals: isSameDay,
    hashCode: getHashCode,
  );
  List<Event> getEventsForDay(DateTime day) {
    return kEvents[day] ?? [];
  }

  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  DateTime? _selectedDay;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOn;

  @override
  void initState() {
    kToday = DateTime.now();
    kFirstDay = DateTime(
      kToday.year,
      kToday.month - 3,
      kToday.day,
    );
    kLastDay = DateTime(
      kToday.year,
      kToday.month + 12,
      kToday.day,
    );
    _selectedDays.add(_focusedDay.value);
    super.initState();
    kEvents = {};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TableCalendar<Event>(
            firstDay: kFirstDay,
            focusedDay: kToday,
            lastDay: kLastDay,
            calendarFormat: CalendarFormat.month,
            selectedDayPredicate: (day) => _selectedDays.contains(day),
            rangeStartDay: _rangeStart,
            rangeEndDay: _rangeEnd,
            rangeSelectionMode: _rangeSelectionMode,
            eventLoader: getEventsForDay,
            onDaySelected: (selectedDay, focusedDay) {
              if (!isSameDay(_selectedDay, selectedDay)) {
                setState(
                  () {
                    _selectedDay = selectedDay;
                    _focusedDay.value = focusedDay;
                    _rangeStart = null;
                    _rangeEnd = null;
                    _rangeSelectionMode = RangeSelectionMode.toggledOff;
                  },
                );
              }
            },
            onRangeSelected: (start, end, focusedDay) {
              setState(
                () {
                  _selectedDay = null;
                  _focusedDay.value = focusedDay;
                  _rangeStart = start;
                  _rangeEnd = end;
                  _rangeSelectionMode = RangeSelectionMode.toggledOn;
                },
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Add Event'),
            content: Text('Add Event Title'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Ok'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Cancel'),
              ),
            ],
          ),
        ),
        label: Text(
          'Add Event',
        ),
        icon: Icon(Icons.add),
      ),
    );
  }
}
