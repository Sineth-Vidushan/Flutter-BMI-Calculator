import 'package:flutter/material.dart';
import 'main_page.dart'; // Import the MainPage widget

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello World App',
      home: MainPage(), // Use MainPage as the home screen
    );
  }
}
