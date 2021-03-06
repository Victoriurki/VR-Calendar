import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:vr_project/features/authentication/home_page.dart/controller/home_page_controller.dart';
import 'package:vr_project/features/authentication/login/view/login_page.dart';
import '../../../../core/models/event_model.dart';
import 'package:vr_project/core/generics/recource.dart';

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
    _controller.setFirstSelectedDay();
    _controller.setDateTimeToTimestamp();
    _controller.populateEvents();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: SafeArea(
            child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                  ),
                  shape: BoxShape.rectangle,
                ),
                child: const Icon(
                  Icons.person,
                  size: 128,
                ),
              ),
              ListTile(
                title: const Text(
                  'Logout',
                  textAlign: TextAlign.center,
                ),
                onTap: () async {
                  final result = await _controller.logout();
                  if (!result.hasError) {
                    await Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => LoginPage()),
                      ),
                    );
                  }
                },
              )
            ],
          ),
        )),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
          child: Hero(
              child: Image.asset('lib/Assets/calendar_logo.png'),
              tag: 'app-logo'),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Observer(
              builder: (_) {
                return TableCalendar<Event>(
                  calendarStyle: const CalendarStyle(
                    selectedDecoration: BoxDecoration(
                      color: Colors.grey,
                      shape: BoxShape.circle,
                    ),
                    weekendTextStyle: TextStyle(
                      color: Colors.red,
                    ),
                    todayDecoration: BoxDecoration(
                      color: Colors.pink,
                      shape: BoxShape.circle,
                    ),
                  ),
                  firstDay: DateTime(2022, 01, 01),
                  lastDay: DateTime(2022, 12, 31),
                  focusedDay: _controller.focusedDay,
                  daysOfWeekVisible: true,
                  headerVisible: true,
                  eventLoader: _controller.eventLoader,
                  selectedDayPredicate: (day) =>
                      isSameDay(_controller.selectedDay, day),
                  calendarFormat: _controller.calendarFormat,
                  onDaySelected: _controller.onDaySelected,
                  onPageChanged: (focusedDay) =>
                      _controller.focusedDay = focusedDay,
                  onFormatChanged: (format) {
                    if (_controller.calendarFormat != format) {
                      setState(
                        () {
                          _controller.setCalendarFormat(format);
                        },
                      );
                    }
                  },
                );
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Observer(
              builder: (_) {
                return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _controller.filteredEventsByDate.length,
                  shrinkWrap: true,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              _controller.filteredEventsByDate[index].title!),
                        ),
                      ),
                    );
                  }),
                );
              },
            )
          ],
        ),
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
              Observer(
                builder: (_) {
                  return TextButton(
                    onPressed: () async {
                      _controller.setDateTimeToTimestamp();
                      await _controller.addEventFirestore(
                        _controller.timestamp!,
                      );

                      Navigator.pop(context);
                      eventController.clear();
                      _controller.populateEvents();
                      setState(() {});
                      return;
                    },
                    child: const Text('Ok'),
                  );
                },
              ),
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
