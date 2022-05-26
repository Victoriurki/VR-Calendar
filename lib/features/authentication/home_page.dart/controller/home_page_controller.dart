import 'package:flutter/material.dart';

import '../../../../core/models/event_model.dart';

class HomePageController extends StatefulWidget {
  const HomePageController({Key? key}) : super(key: key);

  @override
  State<HomePageController> createState() => _HomePageControllerState();
}

class _HomePageControllerState extends State<HomePageController> {
  late Map<DateTime, List<Event>> kEvents;

  List<Event> getEventsForDay(DateTime day) {
    return kEvents[day] ?? [];
  }

  @override
  void initState() {
    kEvents = {};
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
