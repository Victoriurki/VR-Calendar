import 'package:flutter/material.dart';

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
                tag: 'app-logo'
              ),
            )
          ],
        ),
      )),
    );
  }
}
