// Flutter plugin import
import 'package:flutter/material.dart';

// Pages import

// Utils import
import './utils/DevCards.dart';
import './utils/drawer.dart';
import './utils/drawerInfo.dart';

class Developer extends StatefulWidget {
  @override
  _DeveloperState createState() => _DeveloperState();
}

class _DeveloperState extends State<Developer> {
  List<List<String>> dev = [
    [
      "Piyush Sinha",
      "Flutter Evangelist",
      "https://pbs.twimg.com/profile_images/606585229034135553/2NqZJYQI_400x400.png"
    ],
    [
      "Rimjhim Bhadani",
      "Google Venkat Scholar",
      "https://pbs.twimg.com/profile_images/606585229034135553/2NqZJYQI_400x400.png"
    ],
    [
      "Ritwik Raha",
      "The Code Foundation",
      "https://pbs.twimg.com/profile_images/606585229034135553/2NqZJYQI_400x400.png"
    ],
    [
      "Piyush Maheswari",
      "Graphixstory",
      "https://pbs.twimg.com/profile_images/606585229034135553/2NqZJYQI_400x400.png"
    ],
    [
      "Aritra Roy Gosthipaty",
      "The Code Foundation",
      "https://pbs.twimg.com/profile_images/606585229034135553/2NqZJYQI_400x400.png"
    ],
  ];

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
            'Developers',
            style: TextStyle(
              color: Colors.grey.shade600,
            ),
          ),
          elevation: 5.0,
          backgroundColor: Colors.white,
        ),
        drawer: myDrawer(),
        body: ListView(
          children: <Widget>[
            DevCards(
              dev[0][0],
              dev[0][1],
              dev[0][2],
            ),
            DevCards(
              dev[1][0],
              dev[1][1],
              dev[1][2],
            ),
            DevCards(
              dev[2][0],
              dev[2][1],
              dev[2][2],
            ),
            DevCards(
              dev[3][0],
              dev[3][1],
              dev[3][2],
            ),
            DevCards(
              dev[4][0],
              dev[4][1],
              dev[4][2],
            ),
          ],
        ),
      ),
    );
  }
}
