import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RegiterPage extends StatelessWidget {
  const RegiterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 48),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Hero(
                  child: Image.asset('lib/Assets/calendar_logo.png'),
                  tag: 'app-logo'),
            ),
            const Text(
              'Register',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: 'First Name',
                    fillColor: const Color.fromARGB(255, 217, 217, 217),
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 255, 0, 0),
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Last Name',
                    fillColor: const Color.fromARGB(255, 217, 217, 217),
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'E-Mail',
                    fillColor: const Color.fromARGB(255, 217, 217, 217),
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Password',
                    fillColor: const Color.fromARGB(255, 217, 217, 217),
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Confirm Password',
                    fillColor: const Color.fromARGB(255, 217, 217, 217),
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                
              ],
            )
          ],
        ),
      )),
    );
  }
}
