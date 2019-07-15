import 'package:flutter/material.dart';
import './utils/drawer.dart';
import './utils/drawerInfo.dart';
class Empty_Schedule extends StatefulWidget {
  @override
  _Empty_ScheduleState createState() => _Empty_ScheduleState();
}

class _Empty_ScheduleState extends State<Empty_Schedule> {
   Future<bool> _willPopCallback() async {
    // Puts the flag up for "home", in drawer
    selection(0);
    // Pops until the last page remain
    Navigator.popUntil(context, ModalRoute.withName('/'));
    return false; // return true if the route to be popped
  }

   @override
  Widget build(BuildContext context) {
    return WillPopScope(
       onWillPop: _willPopCallback,
          child: Scaffold(
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                        height: 100.0,
                        child: Image.asset("assets/logodevFest.png")),
                    Text(
                     "Coming Soon",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black87),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}