import 'package:flutter/material.dart';
//
import './pages/home.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(
        fontFamily: 'GoogleSans',
      ),
      debugShowCheckedModeBanner: false,
      title: 'devFest19',
      home: HomePage(),
    );
  }
}

