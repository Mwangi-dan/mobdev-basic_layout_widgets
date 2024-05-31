Dart
import 'package:flutter/material.dart';
import 'package:saka_job/account_setup_screen.dart'; // Import AccountSetupScreen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SakaJob',
      theme: ThemeData(
        primarySwatch: Colors.teal, // Example color scheme
      ),
      home: AccountSetupScreen(), // Set AccountSetupScreen as home screen
    );
  }
}
