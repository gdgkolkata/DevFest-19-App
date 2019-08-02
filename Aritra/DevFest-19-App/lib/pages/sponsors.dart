// Flutter plugin imports
import 'dart:io';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'dart:async';
import 'package:flutter/services.dart';

// Pages imports
import './error.dart';
// Utils imports
import './utils/drawer.dart';
import './utils/drawerInfo.dart';

// Data imports
import 'package:devfest19/data/sponsor.dart';

Future<List<Sponsor>> fetchSponsors(
    http.Client client, BuildContext context) async {
  try {
    final response = await client.get(
        'https://raw.githubusercontent.com/Rimjhim28/Devfest-19-Data/master/sponsors.json');
    return compute(parseSponsors, response.body);
  } on SocketException catch (_) {
    selection(0);

    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => ErrorPage(
                  message:
                      "Can't reach the servers, \n Please check your internet connection.",
                )));
  }
}

// A function that converts a response body into a List<Photo>.
List<Sponsor> parseSponsors(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Sponsor>((json) => Sponsor.fromJson(json)).toList();
}

//String details="Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
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
            'Sponsors',
            style: TextStyle(
              color: Theme.of(context).backgroundColor == Colors.white
                  ? Colors.grey.shade600
                  : Colors.white,
            ),
          ),
          elevation: 5.0,
          backgroundColor: Theme.of(context).backgroundColor,
        ),
        drawer: myDrawer(),
        body: FutureBuilder<List<Sponsor>>(
          future: fetchSponsors(http.Client(), context),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);

            return snapshot.hasData
                ? SponsorsList(sponsors: snapshot.data)
                : Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}

class SponsorsList extends StatelessWidget {
  final List<Sponsor> sponsors;

  SponsorsList({Key key, this.sponsors}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: sponsors.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () async {
            var url = sponsors[index].url;
            if (await canLaunch(url)) {
              await launch(url);
            } else {
              throw 'Could not launch $url';
            }
          },
          child: Container(
            height: MediaQuery.of(context).size.height / 2,
            child: Card(
              color: Theme.of(context).backgroundColor,
              elevation: 5.0,
              margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: BorderSide(color: Colors.white, width: 0.2),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Image.network(
                    sponsors[index].logo,
                    height: MediaQuery.of(context).size.height / 5,
                    width: MediaQuery.of(context).size.height / 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      sponsors[index].description.length > 440
                          ? "${sponsors[index].description.substring(0, 400)}..."
                          : sponsors[index].description,
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
