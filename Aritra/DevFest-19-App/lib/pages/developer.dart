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
      "Aritra Roy Gosthipaty",
      "The Code Foundation",
      "https://user-images.githubusercontent.com/26908195/61170217-38937f00-a583-11e9-8fe2-7be6aa2e0a40.jpg"
    ],
    [
      "Piyush Sinha",
      "Flutter Evangelist",
      "https://user-images.githubusercontent.com/26908195/61172548-87e9a780-a5a3-11e9-8c4b-8c866140c7e8.jpg"
    ],
    [
      "Piyush Maheswari",
      "Android | Flutter",
      "https://user-images.githubusercontent.com/26908195/61170219-3df0c980-a583-11e9-9942-ea9ce4b2c1eb.jpg"
    ],
    [
      "Rimjhim Bhadani",
      "GHC Scholar | Google Venkat Scholar",
      "https://user-images.githubusercontent.com/26908195/61170221-40532380-a583-11e9-8210-d04ac9da67d7.JPG"
    ],
    [
      "Ritwik Raha",
      "The Code Foundation",
      "https://user-images.githubusercontent.com/26908195/61170254-21a15c80-a584-11e9-96a6-a39e726716ff.png"
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
            'Team',
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
