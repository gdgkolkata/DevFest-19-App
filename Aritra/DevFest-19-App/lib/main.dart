// Flutter plugin imports
import 'package:devfest19/pages/home.dart';
import 'package:devfest19/pages/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:dynamic_theme/dynamic_theme.dart';

// Utils import

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
      defaultBrightness: Brightness.light,
      data: (brightness) => new ThemeData(
        fontFamily: 'GoogleSans', //font chosen to be GoogleSans
        accentColor: hexToColor("#673ab7"), //this is dark purple
        primaryColor: hexToColor("#673ab7"), //this is dark purple
        brightness: brightness,
        backgroundColor: Colors.white,
      ),
      themedWidgetBuilder: (context,theme){
        return MaterialApp(
      theme: theme,
      
      debugShowCheckedModeBanner: false,
      title: 'devFest19',
      home: HomePage(),
    );
      },
    );
    /*return MaterialApp(
      theme: new ThemeData(
        fontFamily: 'GoogleSans', //font chosen to be GoogleSans
        accentColor: hexToColor("#673ab7"), //this is dark purple
        primaryColor: hexToColor("#673ab7"), //this is dark purple
      ),
      debugShowCheckedModeBanner: false,
      title: 'devFest19',
      home: HomePage(),
    );*/
  }
}
