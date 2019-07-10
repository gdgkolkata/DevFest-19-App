import 'package:devfest19/pages/utils/color.dart';
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
        accentColor: hexToColor("#673ab7"),//this is dark purple
        primaryColor: hexToColor("#673ab7"),
      ),
      debugShowCheckedModeBanner: false,
      title: 'devFest19',
      home: HomePage(),
    );
  }
}

