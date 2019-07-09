import 'package:devfest19/pages/home.dart';

import './color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';

//Import to pages
import 'package:devfest19/pages/schedule.dart';
import 'package:devfest19/pages/speakers.dart';
import 'package:devfest19/pages/developer.dart';
import 'package:devfest19/pages/navigation.dart';

class myDrawer extends StatefulWidget {
  @override
  _myDrawerState createState() => _myDrawerState();
}

class _myDrawerState extends State<myDrawer> {
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
              // child: Image.asset("assets/logodevFest.png"),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Image.asset("assets/logodevFestWtext.png"),
                  ),
                ],
              ),
              margin: EdgeInsets.all(0.0),
              padding: EdgeInsets.all(0.0),
            ),
          ),
          // THIS NEEDS THINGS
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
            child: Container(
              decoration: BoxDecoration(
                color: hexToColor("#CBC5D7"), //this too
                borderRadius: new BorderRadius.only(
                    bottomRight: const Radius.circular(40.0),
                    topRight: const Radius.circular(40.0)),
              ),
              child: ListTile(
                title: Text(
                  "Home",
                  style: TextStyle(
                    color: hexToColor("#673ab7"),//this too
                  ),
                ),
                leading: Icon(
                  Icons.home,
                  color: hexToColor("#673ab7"), //this too
                  size: 25.0,
                ),
                onTap: () {
                  Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
                },
              ),
            ),
          ),
          ListTile(
            title: Text(
              "Schedule",
              style: TextStyle(
                color: Colors.grey.shade600,
              ),
            ),
            leading: Icon(
              Icons.calendar_today,
              color: Colors.grey.shade600,
              size: 25.0,
            ),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Schedule()));
            },
          ),
          ListTile(
            title: Text(
              "Speakers",
              style: TextStyle(
                color: Colors.grey.shade600,
              ),
            ),
            leading: Icon(
              Icons.headset_mic,
              color: Colors.grey.shade600,
              size: 25.0,
            ),
            onTap: () {
              Navigator.push(context,
               MaterialPageRoute(builder: (context) => Speakers()));
            },
          ),
          ListTile(
            title: Text(
              "Find Your Way",
              style: TextStyle(
                color: Colors.grey.shade600,
              ),
            ),
            onTap: () {
               Navigator.push(context,
               MaterialPageRoute(builder: (context) => Navigation()));
            },
            leading: Icon(
              Icons.map,
              color: Colors.grey.shade600,
              size: 25.0,
            ),
          ),
          ListTile(
            title: Text(
              "Sponsors",
              style: TextStyle(
                color: Colors.grey.shade600,
              ),
            ),
            leading: Icon(
              Icons.attach_money,
              color: Colors.grey.shade600,
              size: 25.0,
            ),
          ),
          ListTile(
            title: Text(
              "GDG Kolkata",
              style: TextStyle(
                color: Colors.grey.shade600,
              ),
            ),
            leading: Icon(
              Icons.local_activity,
              color: Colors.grey.shade600,
              size: 25.0,
            ),
            onTap: () async {
              const url = 'https://gdgkolkata.org/';
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'Could not launch $url';
              }
            },
          ),
          Column(
            children: <Widget>[
              Divider(),
              Container(
                child: ListTile(
                  title: Text(
                    "Developers",
                    style: TextStyle(
                      color: Colors.grey.shade600,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context,
                     MaterialPageRoute(builder: (context) => Developer()));
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

