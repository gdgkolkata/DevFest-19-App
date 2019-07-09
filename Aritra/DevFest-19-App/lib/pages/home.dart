import 'package:flutter/material.dart';

//Imports to utils
import 'package:devfest19/utils/drawer.dart';
import 'package:devfest19/utils/color.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String para =
      "DevFests are community-led, developer events hosted by GDG chapters around the globe focused on community building and learning about Google’s technologies. Each DevFest is inspired by and uniquely tailored to the needs of the developer community and region that hosts it.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: new IconThemeData(color: Colors.black87),
        elevation: 5.0,
        title: Text(
          'Home',
          style: TextStyle(
            color: Colors.grey.shade600,
          ),
        ),
        backgroundColor: Colors.white,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: IconButton(
              icon: Icon(Icons.account_circle),
              iconSize: 30.0,
              color: hexToColor('#4885ed'),
              onPressed: () {
                // ToDo: Logic for AUTH
              },
            ),
          ),
        ],
      ),
      drawer: myDrawer(context),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Image.asset("assets/devfest.png"),
                RichText(
                  text: TextSpan(
                    text: "August 2019\n",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: "Welcome to\nGDG Kolkata DevFest\n",
                        style: TextStyle(
                          fontSize: 22.0,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: para,
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width * (1 / 4),
                      20.0,
                      MediaQuery.of(context).size.width * (1 / 4),
                      0.0),
                  child: RaisedButton(
                    padding: EdgeInsets.all(20.0),
                    // color: hexToColor('#C7B7E4'),//Light
                    color: hexToColor('#673ab7'),
                    onPressed: () {
                      // ToDo: URL FOR FORM
                    },
                    child: Text(
                      "Apply Now",
                      // style: TextStyle(color: hexToColor('#673ab7')),//Dark
                         style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
