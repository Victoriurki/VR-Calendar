import 'package:flutter/material.dart';
import 'package:vr_project/features/authentication/register/view/register_page.dart';
import 'package:vr_project/table_calendar_examples/start_page.dart';
import 'features/authentication/home_page.dart/view/home_page_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: HomePage(),
    );
  }
}
