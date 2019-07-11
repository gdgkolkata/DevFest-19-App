import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'dart:async';
//
import './utils/speakerCards.dart';
import 'package:devfest19/data/speaker.dart';

Future<List<Speaker>> fetchSpeakers(http.Client client) async {
  final response =
      await client.get('https://sessionize.com/api/v2/f0dxidzh/view/speakers');

  return compute(parseSpeakers, response.body);
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: 
      AppBar(
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
      
      body: FutureBuilder<List<Speaker>>(
        future: fetchSpeakers(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? SpeakersList(speakers: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
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
        return SpeakerCards(speakers[index].fullName, speakers[index].tagLine, "", speakers[index].profilePicture, speakers[index].bio);
      },
    );
  }
}