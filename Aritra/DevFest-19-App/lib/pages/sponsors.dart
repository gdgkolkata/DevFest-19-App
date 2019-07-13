// Flutter plugin import
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
        body: ListView(
          children: <Widget>[
            // First Sponsor
            GestureDetector(
              onTap: () async {
                const url = 'https://www.jetbrains.com/';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 3,
                child: Card(
                  elevation: 5.0,
                  margin:
                      new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Image.asset(
                        "assets/jetbrains.png",
                        height: MediaQuery.of(context).size.height / 4,
                        width: MediaQuery.of(context).size.height / 2,
                      ),
                      Text(
                        "JetBrains",
                        style: TextStyle(
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Second Sponsor
            GestureDetector(
              onTap: () async {
                const url = 'https://www.manning.com/';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 3,
                child: Card(
                  elevation: 5.0,
                  margin:
                      new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Image.asset(
                        "assets/manning.png",
                        height: MediaQuery.of(context).size.height / 4,
                        width: MediaQuery.of(context).size.height / 2,
                      ),
                      Text(
                        "Manning",
                        style: TextStyle(
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Third Sponsor
            GestureDetector(
              onTap: () async {
                const url = 'https://www.pyimagesearch.com';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 3,
                child: Card(
                  elevation: 5.0,
                  margin:
                      new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Image.asset(
                        "assets/pyimagesearch.png",
                        height: MediaQuery.of(context).size.height / 4,
                        width: MediaQuery.of(context).size.height / 2,
                      ),
                      Text(
                        "PyImageSearch",
                        style: TextStyle(
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
