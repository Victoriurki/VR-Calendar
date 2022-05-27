import 'package:flutter/material.dart';
import 'package:vr_project/features/authentication/login/view/login_page.dart';
import 'package:vr_project/features/authentication/register/view/register_page.dart';
import 'package:vr_project/features/splash/view/splash_screen.dart';
import 'package:vr_project/table_calendar_examples/start_page.dart';
import 'features/authentication/home_page.dart/view/home_page_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'VR Calendar',
      themeMode: ThemeMode.light,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Color.fromARGB(255, 255, 255, 255), brightness: Brightness.light),
      ),
      home: SplashScreen(),
    );
  }
}
