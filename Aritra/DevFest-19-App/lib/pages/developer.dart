// Flutter plugin import
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      "Anubhav Singh",
      "Machine Learning | Web",
      "https://sessionize.com/image?f=0f23cfd8866f41e621578a6852f0749d,400,400,True,False,a4-720f-4317-b318-37a0cf4afef0.4077d175-8c5e-4c78-b4ad-596c234b3408.jpg",
      "https://github.com/xprilion"
    ],
    [
      "Piyush Sinha",
      "Flutter Evangelist",
      "https://user-images.githubusercontent.com/26908195/61172548-87e9a780-a5a3-11e9-8c4b-8c866140c7e8.jpg",
      "https://github.com/piyushsinha24",
    ],
    [
      "Aritra Roy Gosthipaty",
      "Flutter | Java | Android",
      "https://user-images.githubusercontent.com/26908195/61170217-38937f00-a583-11e9-8fe2-7be6aa2e0a40.jpg",
      "https://github.com/ariG23498",
    ],
    [
      "Rimjhim Bhadani",
      "Android | Flutter",
      "https://user-images.githubusercontent.com/26908195/61170221-40532380-a583-11e9-8210-d04ac9da67d7.JPG",
      "https://github.com/Rimjhim28"
    ],
    [
      "Ritwik Raha",
      "UI/UX | Matlab | Image Processing",
      "https://user-images.githubusercontent.com/26908195/61170254-21a15c80-a584-11e9-96a6-a39e726716ff.png",
      "https://github.com/ritwikraha"
    ],
    [
      "Piyush Maheswari",
      "Android | Flutter",
      "https://user-images.githubusercontent.com/26908195/61170219-3df0c980-a583-11e9-9942-ea9ce4b2c1eb.jpg",
      "https://github.com/Piyush2769"
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
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Theme.of(context).backgroundColor == Colors.white
          ? Colors.white10
          : Colors.black, //top bar color
      systemNavigationBarColor:
          Theme.of(context).backgroundColor == Colors.white
              ? Colors.white10
              : Colors.black, //bottom bar color
      systemNavigationBarIconBrightness:
          Theme.of(context).backgroundColor == Colors.white
              ? Brightness.dark
              : Brightness.light,
    ));
    return WillPopScope(
      onWillPop: _willPopCallback,
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          brightness: Theme.of(context).backgroundColor == Colors.white
              ? Brightness.light
              : Brightness.dark, //check
          iconTheme: new IconThemeData(
              color: Theme.of(context).backgroundColor == Colors.white
                  ? Colors.grey.shade600
                  : Colors.white),
          title: Text(
            'Team',
            style: TextStyle(
              color: Theme.of(context).backgroundColor == Colors.white
                  ? Colors.grey.shade600
                  : Colors.white,
            ),
          ),
          elevation: 5.0,
          backgroundColor: Theme.of(context).backgroundColor,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.lightbulb_outline),
              iconSize: 20.0,
              onPressed: () {
                DynamicTheme.of(context).setThemeData(new ThemeData(
                  backgroundColor:
                      Theme.of(context).backgroundColor == Colors.white
                          ? Colors.black
                          : Colors.white,
                ));
              },
            )
          ],
        ),
        drawer: myDrawer(),
        body: ListView(
          children: <Widget>[
            DevCards(
              dev[0][0],
              dev[0][1],
              dev[0][2],
              dev[0][3],
            ),
            DevCards(
              dev[1][0],
              dev[1][1],
              dev[1][2],
              dev[1][3],
            ),
            DevCards(
              dev[2][0],
              dev[2][1],
              dev[2][2],
              dev[2][3],
            ),
            DevCards(
              dev[3][0],
              dev[3][1],
              dev[3][2],
              dev[3][3],
            ),
            DevCards(
              dev[4][0],
              dev[4][1],
              dev[4][2],
              dev[4][3],
            ),
            DevCards(
              dev[5][0],
              dev[5][1],
              dev[5][2],
              dev[5][3],
            ),
          ],
        ),
      ),
    );
  }
}
