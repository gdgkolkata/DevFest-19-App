import 'package:devfest19/data/sessionResponse.dart';
import 'package:devfest19/pages/utils/drawer.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'dart:async';
import 'package:devfest19/pages/utils/sessionCard.dart';

Future<List<SessionResponse>> fetchSessionResponse(http.Client client) async {
  final response =
      await client.get('https://sessionize.com/api/v2/f0dxidzh/view/sessions');

  return compute(parseSessionResponse, response.body);
}

List<SessionResponse> parseSessionResponse(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<SessionResponse>((json) => SessionResponse.fromJson(json)).toList();
}

class Schedule extends StatefulWidget {
  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  //slot,title,speaker,tags,level,venue

  Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  bool isBookmarked = false;
  bool isAdded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: new IconThemeData(color: Colors.black87),
        title: Text(
          'Schedule',
          style: TextStyle(
            color: Colors.grey.shade600,
          ),
        ),
        elevation: 5.0,
        backgroundColor: Colors.white,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: IconButton(
              icon: Icon(Icons.bookmark_border),
              iconSize: 30.0,
              color: hexToColor('#673ab7'),
              onPressed: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: IconButton(
              icon: Icon(Icons.star_border),
              iconSize: 30.0,
              color: hexToColor('#673ab7'),
              onPressed: () {},
            ),
          ),
        ],
      ),
      drawer: myDrawer(),
      body: FutureBuilder<List<SessionResponse>>(
        future: fetchSessionResponse(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? SessionResponseItem(sessionResponse: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class SessionResponseItem extends StatelessWidget {
  final List<SessionResponse> sessionResponse;

  SessionResponseItem({Key key, this.sessionResponse}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: sessionResponse[0].sessionsList.length,
      itemBuilder: (context, index) {
        return SessionCard(
          false,
          false,
          "10.30 AM",
          "title",
          "name",
          "tags",
          "Intermidiate",
          "Hall 1",
          "description"
        );
      },
    );
  }
}
