import 'package:flutter/material.dart';
import './ui/DevCards.dart';
class Developer extends StatefulWidget {
  @override
  _DeveloperState createState() => _DeveloperState();
}

class _DeveloperState extends State<Developer> {
  List<List<String>> dev=[
    ["Rimjhim Bhadani","Google Venkat Scholar","https://pbs.twimg.com/profile_images/606585229034135553/2NqZJYQI_400x400.png"],
    ["Aritra Roy","The Code Foundation","https://pbs.twimg.com/profile_images/606585229034135553/2NqZJYQI_400x400.png"],
    ["Piyush Sinha","Flutter Evangelist","https://pbs.twimg.com/profile_images/606585229034135553/2NqZJYQI_400x400.png"],
    ["Piyush Maheswari","Graphixstory","https://pbs.twimg.com/profile_images/606585229034135553/2NqZJYQI_400x400.png"],
    
  ];
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: 
      AppBar(
        iconTheme: IconThemeData(color: Colors.black87),
        title: Text(
          'Developers',
          style: TextStyle(
            color: Colors.black87,
          ),
        ),
        elevation: 5.0,
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: <Widget>[
          DevCards(dev[0][0],dev[0][1],dev[0][2],),
          DevCards(dev[1][0],dev[1][1],dev[1][2],),
          DevCards(dev[2][0],dev[2][1],dev[2][2],),
          DevCards(dev[3][0],dev[3][1],dev[3][2],),
         
        ],
      ),
    );
  }
}