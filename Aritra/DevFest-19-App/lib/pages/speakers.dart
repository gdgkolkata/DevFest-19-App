// Flutter plugin imports
import 'package:dynamic_theme/dynamic_theme.dart';
import 'dart:io';

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
import './utils/speakerCards.dart';

// Data imports
import 'package:devfest19/data/speaker.dart';

Future<List<Speaker>> fetchSpeakers(
    http.Client client, BuildContext context) async {
  try {
    final response = await client
        .get('https://sessionize.com/api/v2/f0dxidzh/view/speakers');
    return compute(parseSpeakers, response.body);
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
List<Speaker> parseSpeakers(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Speaker>((json) => Speaker.fromJson(json)).toList();
}

class Speakers extends StatefulWidget {
  @override
  _SpeakersState createState() => _SpeakersState();
}

class _SpeakersState extends State<Speakers> {
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
            'Speakers',
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
        body: FutureBuilder<List<Speaker>>(
          future: fetchSpeakers(http.Client(), context),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);

            return snapshot.hasData
                ? SpeakersList(speakers: snapshot.data)
                : Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}

class SpeakersList extends StatelessWidget {
  final List<Speaker> speakers;

  SpeakersList({Key key, this.speakers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: speakers.length,
      itemBuilder: (context, index) {
        return SpeakerCards(
            speakers[index].fullName,
            speakers[index].tagLine,
            "",
            speakers[index].profilePicture,
            speakers[index].bio,
            speakers[index].links);
      },
    );
  }
}
