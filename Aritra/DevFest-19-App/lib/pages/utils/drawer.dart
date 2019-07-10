import 'package:devfest19/pages/home.dart';

import './color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';

import 'drawerInfo.dart';

//Import to pages
import 'package:devfest19/pages/schedule.dart';
import 'package:devfest19/pages/speakers.dart';
import 'package:devfest19/pages/developer.dart';
import 'package:devfest19/pages/navigation.dart';

import 'drawerInfo.dart';

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

            // First Option
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
              child: Container(
                decoration: BoxDecoration(
                  color: select[0] ? hexToColor("#CBC5D7") : Colors.white,
                  // color: hexToColor("#CBC5D7"), //this too
                  // color:Colors.white,
                  borderRadius: new BorderRadius.only(
                      bottomRight: const Radius.circular(40.0),
                      topRight: const Radius.circular(40.0)),
                ),
                child: ListTile(
                  title: Text(
                    "Home",
                    style: TextStyle(
                      color: select[0]
                          ? hexToColor("#673ab7")
                          : Colors.grey.shade600,
                      // color: hexToColor("#673ab7"),//this too
                      // color: Colors.grey.shade600,
                    ),
                  ),
                  leading: Icon(
                    Icons.home,
                    color: select[0]
                        ? hexToColor("#673ab7")
                        : Colors.grey.shade600,
                    // color: hexToColor("#673ab7"), //this too
                    // color: Colors.grey.shade600,
                    size: 25.0,
                  ),
                  onTap: () {
                    // setState(() {
                    // select[0] = true;
                    // select[1] = false;
                    // select[2] = false;
                    // select[3] = false;
                    // select[4] = false;
                    // select[5] = false;
                    // selection(0);
                    // });
                    Navigator.pop(context);
                    if (select[0] != true) {
                      // lastVisited.addLast(findLastVisited());
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
              padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
              child: Container(
                decoration: BoxDecoration(
                  color: select[1] ? hexToColor("#CBC5D7") : Colors.white,
                  // color: hexToColor("#CBC5D7"), //this too
                  // color:Colors.white,
                  borderRadius: new BorderRadius.only(
                      bottomRight: const Radius.circular(40.0),
                      topRight: const Radius.circular(40.0)),
                ),
                child: ListTile(
                  title: Text(
                    "Schedule",
                    style: TextStyle(
                      color: select[1]
                          ? hexToColor("#673ab7")
                          : Colors.grey.shade600,
                      // color: hexToColor("#673ab7"),//this too
                      // color: Colors.grey.shade600,
                    ),
                  ),
                  leading: Icon(
                    Icons.calendar_today,
                    color: select[1]
                        ? hexToColor("#673ab7")
                        : Colors.grey.shade600,
                    // color: hexToColor("#673ab7"), //this too
                    // color: Colors.grey.shade600,
                    size: 25.0,
                  ),
                  onTap: () {
                    // setState(() {
                    // select[0] = false;
                    // select[1] = true;
                    // select[2] = false;
                    // select[3] = false;
                    // select[4] = false;
                    // select[5] = false;
                    // selection(1);
                    // });
                    Navigator.pop(context);
                    // selection(0);
                    if (select[1] != true) {
                      // lastVisited.addLast(findLastVisited());
                      selection(1);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Schedule(),
                          ));
                    }
                  },
                ),
              ),
            ),

            // Third Option
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
              child: Container(
                decoration: BoxDecoration(
                  color: select[2] ? hexToColor("#CBC5D7") : Colors.white,
                  // color: hexToColor("#CBC5D7"), //this too
                  // color:Colors.white,
                  borderRadius: new BorderRadius.only(
                      bottomRight: const Radius.circular(40.0),
                      topRight: const Radius.circular(40.0)),
                ),
                child: ListTile(
                  title: Text(
                    "Speakers",
                    style: TextStyle(
                      color: select[2]
                          ? hexToColor("#673ab7")
                          : Colors.grey.shade600,
                      // color: hexToColor("#673ab7"),//this too
                      // color: Colors.grey.shade600,
                    ),
                  ),
                  leading: Icon(
                    Icons.headset_mic,
                    color: select[2]
                        ? hexToColor("#673ab7")
                        : Colors.grey.shade600,
                    // color: hexToColor("#673ab7"), //this too
                    // color: Colors.grey.shade600,
                    size: 25.0,
                  ),
                  onTap: () {
                    // setState(() {
                    // select[0] = false;
                    // select[1] = false;
                    // select[2] = true;
                    // select[3] = false;
                    // select[4] = false;
                    // select[5] = false;
                    // selection(2);
                    // });
                    Navigator.pop(context);
                    // selection(0);
                    if (select[2] != true) {
                      // lastVisited.addLast(findLastVisited());
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
              padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
              child: Container(
                decoration: BoxDecoration(
                  color: select[3] ? hexToColor("#CBC5D7") : Colors.white,
                  // color: hexToColor("#CBC5D7"), //this too
                  // color:Colors.white,
                  borderRadius: new BorderRadius.only(
                      bottomRight: const Radius.circular(40.0),
                      topRight: const Radius.circular(40.0)),
                ),
                child: ListTile(
                  title: Text(
                    "Find Your Way",
                    style: TextStyle(
                      color: select[3]
                          ? hexToColor("#673ab7")
                          : Colors.grey.shade600,
                      // color: hexToColor("#673ab7"),//this too
                      // color: Colors.grey.shade600,
                    ),
                  ),
                  leading: Icon(
                    Icons.map,
                    color: select[3]
                        ? hexToColor("#673ab7")
                        : Colors.grey.shade600,
                    // color: hexToColor("#673ab7"), //this too
                    // color: Colors.grey.shade600,
                    size: 25.0,
                  ),
                  onTap: () {
                    // setState(() {
                    // select[0] = false;
                    // select[1] = false;
                    // select[2] = false;
                    // select[3] = true;
                    // select[4] = false;
                    // select[5] = false;
                    // selection(3);
                    // });
                    Navigator.pop(context);
                    // selection(0);
                    if (select[3] != true) {
                      // lastVisited.addLast(findLastVisited());
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
              padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
              child: Container(
                decoration: BoxDecoration(
                  color: select[4] ? hexToColor("#CBC5D7") : Colors.white,
                  // color: hexToColor("#CBC5D7"), //this too
                  // color:Colors.white,
                  borderRadius: new BorderRadius.only(
                      bottomRight: const Radius.circular(40.0),
                      topRight: const Radius.circular(40.0)),
                ),
                child: ListTile(
                  title: Text(
                    "Sponsors",
                    style: TextStyle(
                      color: select[4]
                          ? hexToColor("#673ab7")
                          : Colors.grey.shade600,
                      // color: hexToColor("#673ab7"),//this too
                      // color: Colors.grey.shade600,
                    ),
                  ),
                  leading: Icon(
                    Icons.attach_money,
                    color: select[4]
                        ? hexToColor("#673ab7")
                        : Colors.grey.shade600,
                    // color: hexToColor("#673ab7"), //this too
                    // color: Colors.grey.shade600,
                    size: 25.0,
                  ),
                  onTap: () {
                    // setState(() {
                    // select[0] = false;
                    // select[1] = false;
                    // select[2] = false;
                    // select[3] = false;
                    // select[4] = true;
                    // select[5] = false;
                    // selection(4);
                    // });
                    //NAvigate to sponsors
                    Navigator.pop(context);
                    if (select[4] != true) {
                      // lastVisited.addLast(findLastVisited());
                      selection(4);
                      //TOD
                    }
                    // selection(0);
                  },
                ),
              ),
            ),
            // Sixth Option
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
              child: Container(
                decoration: BoxDecoration(
                  color: select[5] ? hexToColor("#CBC5D7") : Colors.white,
                  // color: hexToColor("#CBC5D7"), //this too
                  // color:Colors.white,
                  borderRadius: new BorderRadius.only(
                      bottomRight: const Radius.circular(40.0),
                      topRight: const Radius.circular(40.0)),
                ),
                child: ListTile(
                  title: Text(
                    "GDG Kolkata",
                    style: TextStyle(
                      color: select[5]
                          ? hexToColor("#673ab7")
                          : Colors.grey.shade600,
                      // color: hexToColor("#673ab7"),//this too
                      // color: Colors.grey.shade600,
                    ),
                  ),
                  leading: Icon(
                    Icons.local_activity,
                    color: select[5]
                        ? hexToColor("#673ab7")
                        : Colors.grey.shade600,
                    // color: hexToColor("#673ab7"), //this too
                    // color: Colors.grey.shade600,
                    size: 25.0,
                  ),
                  onTap: () async {
                    // setState(() {
                    // select[0] = false;
                    // select[1] = false;
                    // select[2] = false;
                    // select[3] = false;
                    // select[4] = false;
                    // select[5] = true;
                    // selection(5);
                    // });
                    Navigator.pop(context);
                    // selection(0);
                    if (select[5] != true) {
                      // lastVisited.addLast(findLastVisited());
                      selection(0);
                      const url = 'https://gdgkolkata.org/';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
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
                      "Developers",
                      style: TextStyle(
                        color: Colors.grey.shade600,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      if (select[6] != true) {
                        // lastVisited.addLast(findLastVisited());
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
