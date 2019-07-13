// Flutter plugin import
import 'package:flutter/material.dart';

// Pages import

// Utils import
import './utils/drawer.dart';
import './utils/drawerInfo.dart';

class Sponsors extends StatefulWidget {
  @override
  _SponsorsState createState() => _SponsorsState();
}

class _SponsorsState extends State<Sponsors> {

  // Method that executes on pressing the "Back Button"
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
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black87),
          title: Text(
            'Sponsors',
            style: TextStyle(
              color: Colors.grey.shade600,
            ),
          ),
          elevation: 5.0,
          backgroundColor: Colors.white,
        ),
        drawer: myDrawer(),
        body: GridView.count(
          padding: const EdgeInsets.all(20.0),
          crossAxisSpacing: 10.0,
          crossAxisCount: 2,
          children: <Widget>[
            // Image.asset("assets/googledev.png"),
            // Image.asset("assets/jetbrains.png"),
            // Image.asset("assets/manning.png"),
            // Image.asset("assets/pyimagesearch.png")
            Image.asset("assets/devfest.png"),
            Image.asset("assets/devfest.png"),
            Image.asset("assets/devfest.png"),
            Image.asset("assets/devfest.png")
            ],
        )   
      ),
    );
  }
}
