// Flutter plugin imports
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';


// Pages import

// Utils import
import './utils/color.dart';
import './utils/drawer.dart';
import 'dart:io';
import 'dart:async';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool hasNet = false;
  void internetCheck() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
        setState(() {
          hasNet = true;
        });
      }
    } on SocketException catch (_) {
      print('not connected');
      setState(() {
        hasNet = false;
      });
    }
  }

  String para =
      "DevFests are community-led, developer events hosted by GDG chapters around the globe focused on community building and learning about Google’s technologies. Each DevFest is inspired by and uniquely tailored to the needs of the developer community and region that hosts it.";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    internetCheck();
  }

  // Method which executes on pushing "Back Button"
  Future<bool> _willPopCallback() async {
    // Exits the app
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    return true; // return true if the route to be popped
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor:Theme.of(context).backgroundColor==Colors.white? Colors.white10:Colors.black, //top bar color
      systemNavigationBarColor: Theme.of(context).backgroundColor==Colors.white? Colors.white10:Colors.black, //bottom bar color
      systemNavigationBarIconBrightness: Theme.of(context).backgroundColor==Colors.white? Brightness.dark:Brightness.light,
    ));
    debugPrint(hasNet.toString());
    return WillPopScope(
      onWillPop: _willPopCallback,
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          brightness: Theme.of(context).backgroundColor==Colors.white? Brightness.light:Brightness.dark, //check
          iconTheme: new IconThemeData(color:Theme.of(context).backgroundColor==Colors.white? Colors.grey.shade600:Colors.white),
          elevation: 5.0,
          title: Text(
            'Home',
            style: TextStyle(
              color: Theme.of(context).backgroundColor==Colors.white? Colors.grey.shade600:Colors.white,
            ),
          ),
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
            Image.asset("assets/logodevFest.png",height: MediaQuery.of(context).size.height * 0.4),
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
                        color: Theme.of(context).backgroundColor==Colors.white?Colors.black:Colors.white,
                      ),
                    ),
                    TextSpan(
                      text: para,
                      style: TextStyle(
                        fontSize: 14.0,
                        height: 1.5,
                        color: Colors.grey.shade600,
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
