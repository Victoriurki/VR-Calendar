import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../core/generics/get_hashcode.dart';
import '../core/models/event_model.dart';

class TableComplexExample extends StatefulWidget {
  const TableComplexExample({Key? key}) : super(key: key);

  @override
  _TableComplexExampleState createState() => _TableComplexExampleState();
}

class _TableComplexExampleState extends State<TableComplexExample> {
  late DateTime kToday;
  late DateTime kFirstDay;
  late DateTime kLastDay;
  late DateTime? _selectedDay;

  late final ValueNotifier<List<Event>> _selectedEvents;
  late Map<DateTime, List<Event>> kEvents;
  final ValueNotifier<DateTime> _focusedDay = ValueNotifier(DateTime.now());

  final Set<DateTime> _selectedDays = LinkedHashSet<DateTime>(
    equals: isSameDay,
    hashCode: getHashCode,
  );
  TextEditingController eventController = TextEditingController();
  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOff;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  @override
  void initState() {
    super.initState();
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
    kEvents = {};
    _selectedDays.add(_focusedDay.value);
    _selectedEvents = ValueNotifier(_getEventsForDay(_focusedDay.value));
    _selectedDay = kToday;
  }

  @override
  void dispose() {
    _focusedDay.dispose();
    _selectedEvents.dispose();
    super.dispose();
  }

  List<Event> _getEventsForDay(DateTime day) {
    return kEvents[day] ?? [];
  }

  List<Event> _getEventsForDays(Iterable<DateTime> days) {
    return [
      for (final d in days) ..._getEventsForDay(d),
    ];
  }

  List<DateTime> daysInRange(DateTime first, DateTime last) {
    final dayCount = last.difference(first).inDays + 1;
    return List.generate(
      dayCount,
      (index) => DateTime.utc(first.year, first.month, first.day + index),
    );
  }

  List<Event> _getEventsForRange(DateTime start, DateTime end) {
    final days = daysInRange(start, end);
    return _getEventsForDays(days);
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(
      () {
        _selectedDay = focusedDay;
        if (_selectedDays.contains(selectedDay)) {
          _selectedDays.remove(selectedDay);
          _selectedDay = kToday;
        } else {
          _selectedDays.add(selectedDay);
        }
        _focusedDay.value = focusedDay;
        _rangeStart = null;
        _rangeEnd = null;
        _rangeSelectionMode = RangeSelectionMode.toggledOff;
      },
    );

    _selectedEvents.value = _getEventsForDays(_selectedDays);
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      _focusedDay.value = focusedDay;
      _rangeStart = start;
      _rangeEnd = end;
      _selectedDays.clear();
      _rangeSelectionMode = RangeSelectionMode.toggledOn;
    });

    if (start != null && end != null) {
      _selectedEvents.value = _getEventsForRange(start, end);
    } else if (start != null) {
      _selectedEvents.value = _getEventsForDay(start);
    } else if (end != null) {
      _selectedEvents.value = _getEventsForDay(end);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TableCalendar - Complex'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TableCalendar<Event>(
            firstDay: kFirstDay,
            lastDay: kLastDay,
            focusedDay: _focusedDay.value,
            headerVisible: false,
            selectedDayPredicate: (day) => _selectedDays.contains(day),
            rangeStartDay: _rangeStart,
            rangeEndDay: _rangeEnd,
            calendarFormat: _calendarFormat,
            rangeSelectionMode: _rangeSelectionMode,
            eventLoader: _getEventsForDay,
            onDaySelected: _onDaySelected,
            onRangeSelected: _onRangeSelected,
            onPageChanged: (focusedDay) => _focusedDay.value = focusedDay,
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() => _calendarFormat = format);
              }
            },
          ),
          ..._getEventsForDay(_selectedDay!).map(
            (Event event) => ListTile(
              title: Text(event.title),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Add Event'),
            content: TextFormField(
              controller: eventController,
              //Text('Add Event Title'),
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
