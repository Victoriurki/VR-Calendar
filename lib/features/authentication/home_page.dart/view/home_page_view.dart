import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:vr_project/features/authentication/home_page.dart/controller/home_page_controller.dart';
import '../../../../core/models/event_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final TextEditingController eventController = TextEditingController();

  final _controller = HomePageController();

  @override
  void initState() {
    _controller.setFirstSelectedDay;
    _controller.setDateTimeToTimestamp();
    _controller.populateEvents();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TableCalendar - Complex'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Observer(
            builder: (_) {
              return Expanded(
                child: TableCalendar<Event>(
                  firstDay: DateTime(2022, 01, 01),
                  lastDay: DateTime(2022, 12, 31),
                  focusedDay: _controller.focusedDay,
                  headerVisible: false,
                  eventLoader: _controller.eventLoader,
                  selectedDayPredicate: (day) =>
                      _controller.selectedDays.contains(day),
                  calendarFormat: _controller.calendarFormat,
                  onDaySelected: _controller.onDaySelected,
                  onPageChanged: (focusedDay) =>
                      _controller.focusedDay = focusedDay,
                  onFormatChanged: (format) {
                    if (_controller.calendarFormat != format) {
                      setState(() {
                        _controller.setCalendarFormat(format);
                      });
                    }
                  },
                ),
              );
            },
          ),
          Observer(
            builder: (_) {
              return Flexible(
                child: ListView.builder(
                    itemCount: _controller.filteredEventsByDate.length,
                    shrinkWrap: true,
                    itemBuilder: ((context, index) {
                      return ListTile(
                        title: Text(
                            _controller.filteredEventsByDate[index].title!),
                      );
                    })),
              );
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Add Event'),
            content: TextFormField(
              onChanged: _controller.changeTitle,
              //Text('Add Event Title'),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              Observer(builder: (_) {
                return TextButton(
                  onPressed: () async {
                    await _controller.addEventFirestore(
                      _controller.timestamp!,
                    );

                    Navigator.pop(context);
                    eventController.clear();
                    setState(() {});
                    return;
                  },
                  child: const Text('Ok'),
                );
              }),
            ],
          ),
        ),
        label: const Text(
          'Add Event',
        ),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
