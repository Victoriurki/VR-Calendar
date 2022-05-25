import 'package:flutter/material.dart';
import 'package:vr_project/features/authentication/register/view/register_page.dart';
import 'package:vr_project/table_calendar_examples/start_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: RegiterPage(),
    );
  }
}
