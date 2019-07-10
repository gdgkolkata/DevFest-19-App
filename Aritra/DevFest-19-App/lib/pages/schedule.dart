import 'package:flutter/material.dart';
//
import 'package:devfest19/pages/utils/sessionCard.dart';

class Schedule extends StatefulWidget {
  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  //slot,title,speaker,tags,level,venue
  List<List<String>> schedule=[
    ["10:30 AM","Google KeyNote","Sundar Pichai","","Beginner","Hall-1"],
    ["10:30 AM","Google Assistant","Jeremy Allison","","Intermediate","Hall-2"],
    ["12:30 AM","Product Strategies","Jack Ma","product,market analysis","Beginner","Hall-3"],
    ["1:00 AM","Payments with Flutter","Pawan Kumar","android,flutter,stripe","Intermediate","Hall-1"],
    ["2:30 AM","Async Coding with Kotlin","Max Shafirov","android,kotlin","Advance","Hall-2"],
    ["4:00 AM","Tensor Flow 2.0","Rajat Monga","machine learning,tensor flow","Intermediate","Hall-2"],
  ];
  
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
      body: ListView(
        children: <Widget>[
         Container(
           height: MediaQuery.of(context).size.height / 4,
           child: ListView(
             scrollDirection: Axis.horizontal,
             children: <Widget>[
               SessionCard(false,false,schedule[0][0],schedule[0][1],schedule[0][2],schedule[0][3],schedule[0][4],schedule[0][5]),
               SessionCard(false,false,schedule[1][0],schedule[1][1],schedule[1][2],schedule[1][3],schedule[1][4],schedule[1][5]),
             ],
           ),
         ), 
         SessionCard(false,false,schedule[2][0],schedule[2][1],schedule[2][2],schedule[2][3],schedule[2][4],schedule[2][5]),
         SessionCard(false,false,schedule[3][0],schedule[3][1],schedule[3][2],schedule[3][3],schedule[3][4],schedule[3][5]),
         SessionCard(false,false,schedule[4][0],schedule[4][1],schedule[4][2],schedule[4][3],schedule[4][4],schedule[4][5]),
         SessionCard(false,false,schedule[5][0],schedule[5][1],schedule[5][2],schedule[5][3],schedule[5][4],schedule[5][5]),
        ],
      ),
    );
  }
}
