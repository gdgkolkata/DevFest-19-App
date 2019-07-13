// Flutter plugin imports
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:http/http.dart' as http;

// Pages import

// Utils import
import './utils/color.dart';
import './utils/drawer.dart';
import 'dart:io';
import 'dart:async';

bool hasNet = false;
void internetCheck() async {
  try {
    await http.get('https://www.google.com/');
    hasNet = true;
  } on SocketException catch (_) {
    hasNet = false;
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String para =
      "DevFests are community-led, developer events hosted by GDG chapters around the globe focused on community building and learning about Google’s technologies. Each DevFest is inspired by and uniquely tailored to the needs of the developer community and region that hosts it.";

  @override
  Widget build(BuildContext context) {

    internetCheck();

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white10, //top bar color
      systemNavigationBarColor: Colors.white10, //bottom bar color
      systemNavigationBarIconBrightness: Brightness.dark,
    ));

    // Method which executes on pushing "Back Button"
    Future<bool> _willPopCallback() async {
      // Exits the app
      SystemChannels.platform.invokeMethod('SystemNavigator.pop');
      return true; // return true if the route to be popped
    }

    return WillPopScope(
      onWillPop: _willPopCallback,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          brightness: Brightness.light, //check
          iconTheme: new IconThemeData(color: Colors.grey.shade600),
          elevation: 5.0,
          title: Text(
            'Home',
            style: TextStyle(
              color: Colors.grey.shade600,
            ),
          ),
          backgroundColor: Colors.white,
        ),
        drawer: myDrawer(),
        body: ListView(
          children: <Widget>[
            Image.asset("assets/devfest.png"),
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
                        color: Colors.black,
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
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 40.0, 8.0, 0.0),
              child: Text(
                "Highlights 2018\n",
                style: TextStyle(
                  fontSize: 22.0,
                  color: Colors.grey,
                ),
              ),
            ),
            // Video
            hasNet
                ? Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                    child: Container(
                        height: 250.0,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: WebView(
                          initialUrl:
                              'https://www.youtube.com/embed/jG2_TN-jfH4?autoplay=0&rel=0',
                          javaScriptMode: JavaScriptMode.unrestricted,
                        )),
                  )
                : Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                    child: Container(
                        height: 250.0,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Image.asset("assets/devfestfull.png")),
                  ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width * (1 / 3),
                  30.0,
                  MediaQuery.of(context).size.width * (1 / 3),
                  10.0),
              child: RaisedButton(
                padding: EdgeInsets.all(20.0),
                color: hexToColor('#673ab7'),
                onPressed: () async {
                  const url =
                      'https://docs.google.com/forms/d/e/1FAIpQLSfnitNzIblk6ciVqYgIHRM303Dl44ZvpAtMcqvqWQeQUBYLdw/viewform';
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                },
                child: Text(
                  "Apply Now",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
