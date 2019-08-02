// Flutter plugin imports
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Pages import

// Utils import
import './utils/drawer.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String para =
      "DevFests are community-led, developer events hosted by GDG chapters around the globe focused on community building and learning about Google’s technologies. Each DevFest is inspired by and uniquely tailored to the needs of the developer community and region that hosts it.";

  // Method which executes on pushing "Back Button"
  Future<bool> _willPopCallback() async {
    // Exits the app
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    return true; // return true if the route to be popped
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.black,
        systemNavigationBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Colors.black //bottom bar color
        ));
    return WillPopScope(
      onWillPop: _willPopCallback,
      child: Scaffold(
        backgroundColor: Colors.black, //for the whole app
        appBar: AppBar(
          brightness: Brightness.dark,
          iconTheme: new IconThemeData(color: Colors.white),
          elevation: 5.0,
          title: Text(
            'Home',
            style: TextStyle(
              // color: Colors.grey.shade600,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.black,
        ),
        drawer: myDrawer(),
        body: ListView(
          children: <Widget>[
            Image.asset("assets/logodevFest.png",
                height: MediaQuery.of(context).size.height * 0.4),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 0.0),
              child: RichText(
                text: TextSpan(
                  text: "August 4, 2019\n\n",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: "Welcome to\nGDG Kolkata DevFest\n\n",
                      style: TextStyle(
                        fontSize: 22.0,
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(
                      text: para,
                      style: TextStyle(
                        fontSize: 14.0,
                        height: 1.5,
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
