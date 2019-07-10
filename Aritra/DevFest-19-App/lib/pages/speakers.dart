import 'package:devfest19/pages/utils/drawer.dart';
import 'package:flutter/material.dart';
import './utils/speakerCards.dart';
import './utils/drawerInfo.dart';
import 'home.dart';

class Speakers extends StatefulWidget {
  @override
  _SpeakersState createState() => _SpeakersState();
}

class _SpeakersState extends State<Speakers> {
  List<List<String>> speakers = [
    [
      "Sundar Pichai",
      "Google",
      "Google KeyNote",
      "https://pbs.twimg.com/profile_images/864282616597405701/M-FEJMZ0_400x400.jpg"
    ],
    [
      "Jack Ma",
      "Alibaba",
      "Product Strategies",
      "https://assets.bwbx.io/images/users/iqjWHBFdfxIU/iipkVStIR4BQ/v0/1000x-1.jpg"
    ],
    [
      "Pawan Kumar",
      "GDE",
      "Payments With Flutter",
      "https://avatars0.githubusercontent.com/u/12619420?s=460&v=4"
    ],
    [
      "Max Shafirov",
      "JetBrains",
      "Async Coding with Kotlin",
      "https://avatars0.githubusercontent.com/u/121982?s=460&v=4"
    ],
    [
      "Rajat Monga",
      "Facebook",
      "Tensor Flow 2.0",
      "https://mlconf.com/wp-content/uploads/2019/01/TT-161111-164253-400x400.jpg"
    ],
  ];

  Future<bool> _willPopCallback() async {
    // await showDialog or Show add banners or whatever
    // then
    // selection(lastVisited.removeLast());
    selection(0);
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
            'Speakers',
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
            SpeakerCards(
              speakers[0][0],
              speakers[0][1],
              speakers[0][2],
              speakers[0][3],
            ),
            SpeakerCards(
              speakers[1][0],
              speakers[1][1],
              speakers[1][2],
              speakers[1][3],
            ),
            SpeakerCards(
              speakers[2][0],
              speakers[2][1],
              speakers[2][2],
              speakers[2][3],
            ),
            SpeakerCards(
              speakers[3][0],
              speakers[3][1],
              speakers[3][2],
              speakers[3][3],
            ),
            SpeakerCards(
              speakers[4][0],
              speakers[4][1],
              speakers[4][2],
              speakers[4][3],
            ),
          ],
        ),
      ),
    );
  }
}
