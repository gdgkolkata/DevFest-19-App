// Flutter plugin imports
import 'package:devfest19/pages/utils/color.dart';
import 'package:flutter/material.dart';

// Pages import
import './pages/home.dart';

// Utils import


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(
        fontFamily: 'GoogleSans',//font chosen to be GoogleSans
        accentColor: hexToColor("#673ab7"),//this is dark purple
        primaryColor: hexToColor("#673ab7"),//this is dark purple
      ),
      debugShowCheckedModeBanner: false,
      title: 'devFest19',
      home: HomePage(),
    );
  }
}

