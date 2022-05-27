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
  late DateTime? _selectedDay;
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

  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOn;
  TextEditingController eventController = TextEditingController();

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
    _selectedDay = kToday;
  }

  @override
  void dispose() {
    eventController.dispose();
    super.dispose();
  }

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      if (_selectedDays.contains(selectedDay)) {
        _selectedDays.remove(selectedDay);
      } else {
        _selectedDays.add(selectedDay);
      }

      _focusedDay.value = focusedDay;
      _rangeStart = null;
      _rangeEnd = null;
      _rangeSelectionMode = RangeSelectionMode.toggledOff;
    });

    kEvents[_selectedDay!] = getEventsForDay(_selectedDay!);
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
            onDaySelected: onDaySelected,
            onRangeSelected: (start, end, focusedDay) {
              if (start == null && end == null) {
                setState(
                  () {
                    _selectedDay = kToday;
                    _focusedDay.value = focusedDay;
                    _rangeStart = null;
                    _rangeEnd = null;
                    _rangeSelectionMode = RangeSelectionMode.toggledOn;
                  },
                );
              }
              if (start != null && end == null) {
                setState(
                  () {
                    _selectedDay = start;
                    _focusedDay.value = focusedDay;
                    _rangeStart = null;
                    _rangeEnd = null;
                    _rangeSelectionMode = RangeSelectionMode.toggledOn;
                  },
                );
              }
              if (start != null && end != null) {
                setState(
                  () {
                    _selectedDay = null;
                    _focusedDay.value = focusedDay;
                    _rangeStart = start;
                    _rangeEnd = end;
                    _rangeSelectionMode = RangeSelectionMode.toggledOn;
                  },
                );
              } else
                () {};
            },
          ),
          ...getEventsForDay(_selectedDay!).map(
            (Event event) => ListTile(
              title: Text(event.title),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Add Event'),
            content: TextFormField(
              controller: eventController,              
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  if (eventController.text.isEmpty) {
                    Navigator.pop(context);
                    return;
                  }
                  if (kEvents[_selectedDay] != null) {
                    kEvents[_selectedDay]!.add(
                      Event(title: eventController.text),
                    );
                  } else {
                    kEvents[_selectedDay!] = [
                      Event(title: eventController.text)
                    ];
                  }
                  Navigator.pop(context);
                  eventController.clear();
                  setState(() {});
                  return;
                },
                child: Text('Ok'),
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
