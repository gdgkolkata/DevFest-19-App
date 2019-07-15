// Flutter plugin imports
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
//  Pages import
import 'package:devfest19/pages/home.dart';
import 'package:devfest19/pages/schedule.dart';
import 'package:devfest19/pages/speakers.dart';
import 'package:devfest19/pages/developer.dart';
import 'package:devfest19/pages/navigation.dart';
import 'package:devfest19/pages/sponsors.dart';
import 'package:devfest19/pages/empty_schedule.dart';

// Utils import
import 'drawerInfo.dart';
import './color.dart';

//Data import
import 'package:devfest19/data/schedule_response.dart';


Future<ScheduleResponse> fetchResponse() async {
  print('FETCH RESPONSE');
  final response =
      await http.get('https://raw.githubusercontent.com/Rimjhim28/Devfest-19-Data/master/state.json?t=timestamp');

  if (response.statusCode == 200) {
    // If server returns an OK response, parse the JSON.
    return ScheduleResponse.fromJson(json.decode(response.body));
  } else {
    // If that response was not OK, throw an error.
    throw Exception('Failed to load post');
  }
}

class myDrawer extends StatefulWidget {
  @override
  myDrawerState createState() => myDrawerState();
}

class myDrawerState extends State<myDrawer> {

ScheduleResponse rsp;

void getResponse() async {
  rsp = await fetchResponse();
  print('INSIDE RESPONSE: ${rsp.state}' );
}
  @override
  void initState(){
    super.initState();
    getResponse();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.09,
              child: DrawerHeader(
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10.0),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Image.asset("assets/logodevFest.png"),
                    ),
                  ],
                ),
                margin: EdgeInsets.all(0.0),
                padding: EdgeInsets.all(0.0),
              ),
            ),

            // First Option
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 0.0),
              child: Container(
                decoration: BoxDecoration(
                  color: select[0] ? hexToColor("#CBC5D7") : Colors.white,
                  borderRadius: new BorderRadius.only(
                      bottomRight: const Radius.circular(40.0),
                      topRight: const Radius.circular(40.0)),
                ),
                child: ListTile(
                  title: Text(
                    "Home",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: select[0]
                          ? hexToColor("#673ab7")
                          : Colors.grey.shade600,
                    ),
                  ),
                  leading: Icon(
                    Icons.home,
                    color: select[0]
                        ? hexToColor("#673ab7")
                        : Colors.grey.shade600,
                    size: 25.0,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    if (select[0] != true) {
                      selection(0);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ));
                    }
                  },
                ),
              ),
            ),

            // Second Option
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 0.0),
              child: Container(
                decoration: BoxDecoration(
                  color: select[1] ? hexToColor("#CBC5D7") : Colors.white,
                  borderRadius: new BorderRadius.only(
                      bottomRight: const Radius.circular(40.0),
                      topRight: const Radius.circular(40.0)),
                ),
                child: ListTile(
                  title: Text(
                    "Schedule",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: select[1]
                          ? hexToColor("#673ab7")
                          : Colors.grey.shade600,
                    ),
                  ),
                  leading: Icon(
                    Icons.calendar_today,
                    color: select[1]
                        ? hexToColor("#673ab7")
                        : Colors.grey.shade600,
                    size: 25.0,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    if (select[1] != true) {
                      selection(1);
                      if(rsp.state == 1) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Schedule(),
                          ));
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Empty_Schedule(),
                          ));
                      }
                    }
                  },
                ),
              ),
            ),

            // Third Option
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 0.0),
              child: Container(
                decoration: BoxDecoration(
                  color: select[2] ? hexToColor("#CBC5D7") : Colors.white,
                  borderRadius: new BorderRadius.only(
                      bottomRight: const Radius.circular(40.0),
                      topRight: const Radius.circular(40.0)),
                ),
                child: ListTile(
                  title: Text(
                    "Speakers",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: select[2]
                          ? hexToColor("#673ab7")
                          : Colors.grey.shade600,
                    ),
                  ),
                  leading: Icon(
                    Icons.headset_mic,
                    color: select[2]
                        ? hexToColor("#673ab7")
                        : Colors.grey.shade600,
                    size: 25.0,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    if (select[2] != true) {
                      selection(2);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Speakers()));
                    }
                  },
                ),
              ),
            ),

            // Forth Option
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 0.0),
              child: Container(
                decoration: BoxDecoration(
                  color: select[3] ? hexToColor("#CBC5D7") : Colors.white,
                  borderRadius: new BorderRadius.only(
                      bottomRight: const Radius.circular(40.0),
                      topRight: const Radius.circular(40.0)),
                ),
                child: ListTile(
                  title: Text(
                    "Find Your Way",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: select[3]
                          ? hexToColor("#673ab7")
                          : Colors.grey.shade600,
                    ),
                  ),
                  leading: Icon(
                    Icons.map,
                    color: select[3]
                        ? hexToColor("#673ab7")
                        : Colors.grey.shade600,
                    size: 25.0,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    if (select[3] != true) {
                      selection(3);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Navigation()));
                    }
                  },
                ),
              ),
            ),

            // Fifth Option
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 0.0),
              child: Container(
                decoration: BoxDecoration(
                  color: select[4] ? hexToColor("#CBC5D7") : Colors.white,
                  borderRadius: new BorderRadius.only(
                      bottomRight: const Radius.circular(40.0),
                      topRight: const Radius.circular(40.0)),
                ),
                child: ListTile(
                  title: Text(
                    "Sponsors",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: select[4]
                          ? hexToColor("#673ab7")
                          : Colors.grey.shade600,
                    ),
                  ),
                  leading: Icon(
                    Icons.attach_money,
                    color: select[4]
                        ? hexToColor("#673ab7")
                        : Colors.grey.shade600,
                    size: 25.0,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    if (select[4] != true) {
                      selection(4);
                      //To Do:
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Sponsors()));
                    }
                  },
                ),
              ),
            ),

            // Sixth Option
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 0.0),
              child: Container(
                decoration: BoxDecoration(
                  color: select[5] ? hexToColor("#CBC5D7") : Colors.white,
                  borderRadius: new BorderRadius.only(
                      bottomRight: const Radius.circular(40.0),
                      topRight: const Radius.circular(40.0)),
                ),
                child: ListTile(
                  title: Text(
                    "GDG Kolkata",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: select[5]
                          ? hexToColor("#673ab7")
                          : Colors.grey.shade600,
                    ),
                  ),
                  leading: Icon(
                    Icons.local_activity,
                    color: select[5]
                        ? hexToColor("#673ab7")
                        : Colors.grey.shade600,
                    size: 25.0,
                  ),
                  onTap: () async {
                    Navigator.pop(context);
                    // selection(0);
                    if (select[5] != true) {
                      selection(0);
                      const url = 'https://gdgkolkata.org/';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                      Navigator.popUntil(context, ModalRoute.withName('/'));
                    }
                  },
                ),
              ),
            ),

            // The lower container
            Column(
              children: <Widget>[
                Divider(),
                Container(
                  child: ListTile(
                    title: Text(
                      "Team",
                      style: TextStyle(
                        color: Colors.grey.shade600,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      if (select[6] != true) {
                        selection(6);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Developer()));
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
