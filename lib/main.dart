import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vr_project/firebase_options.dart';
import 'my_app_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}
