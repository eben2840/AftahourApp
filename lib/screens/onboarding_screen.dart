import 'package:aftahrs/screens/All_Boarding_Screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Onboarding Screens',
      theme: ThemeData(
          // primarySwatch: Colors.blue,
          ),
      home: OnboardingScreen(),
    );
  }
}
