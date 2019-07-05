import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//
import './ui/countdown.dart';
import './ui/myButton.dart';
import './navigation.dart';
import './schedule.dart';
import './speakers.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String description =
      "DevFests are large, community-run developer events happening around the globe focused on community building and learning about Google’s technologies. Hosted by GDG Kolkata, WTM Kolkata, and GCDC Kolkata, DevFest Kolkata will cover multiple product areas such as (but are not limited to) Android, Firebase, Google Cloud Platform, Google Assistant, Flutter, machine learning with TensorFlow, and Mobile Web.";

  //Drawer
  Widget myDrawer() {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/drawer.png"), fit: BoxFit.cover),
              ),
            ),
            ListTile(
              title: Text(
                "Home",
                style: TextStyle(
                  color: Colors.black87,
                ),
              ),
              leading: Icon(
                Icons.home,
                color: Colors.black87,
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
            ),
            ListTile(
              title: Text(
                "Schedule",
                style: TextStyle(
                  color: Colors.black87,
                ),
              ),
              leading: Icon(
                Icons.calendar_today,
                color: Colors.black87,
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Schedule()));
              },
            ),
            ListTile(
              title: Text(
                "Speakers",
                style: TextStyle(
                  color: Colors.black87,
                ),
              ),
              leading: Icon(
                Icons.headset_mic,
                color: Colors.black87,
              ),
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Speakers()));
              },
            ),
            ListTile(
              title: Text(
                "Find Your Way",
                style: TextStyle(
                  color: Colors.black87,
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Navigation()));
              },
              leading: Icon(
                Icons.map,
                color: Colors.black87,
              ),
            ),
            ListTile(
              title: Text(
                "Sponsers",
                style: TextStyle(
                  color: Colors.black87,
                ),
              ),
              leading: Icon(
                Icons.attach_money,
                color: Colors.black87,
              ),
            ),
            ListTile(
              title: Text(
                "GDG Kolkata",
                style: TextStyle(
                  color: Colors.black87,
                ),
              ),
              leading: Icon(
                Icons.local_activity,
                color: Colors.black87,
              ),
            ),
            ListTile(
              title: Text(
                "Developers",
                style: TextStyle(
                  color: Colors.black87,
                ),
              ),
              leading: Icon(
                Icons.android,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.white,
    ));
    return Scaffold(
      appBar: AppBar(
        iconTheme: new IconThemeData(color: Colors.black87),
        elevation: 5.0,
        title: Text(
          'Home',
          style: TextStyle(
            color: Colors.black87,
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
              onPressed: () {},
            ),
          ),
        ],
      ),
      drawer: myDrawer(),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "Devfest'19",
              style: TextStyle(
                color: Colors.black87,
                fontSize: 30.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              description,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 15.0,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                ),
                child: Icon(Icons.location_on),
              ),
              Text(
                "Kolkata",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 15.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10.0,
                ),
                child: Icon(Icons.calendar_today),
              ),
              Text(
                "3rd August, 2019",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 15.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10.0,
                ),
                child: Icon(Icons.access_time),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Text(
                  "10:00 AM",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 15.0,
                  ),
                ),
              ),
            ],
          ),
          countDown(),
          myButton("RSVP"),
        ],
      ),
    );
  }
}
