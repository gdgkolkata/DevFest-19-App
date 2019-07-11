import 'package:flutter/material.dart';
//
import 'package:devfest19/pages/utils/color.dart';
class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

class speakerDetails extends StatefulWidget {
  String _name, _company, _imgURL, _bio;
  speakerDetails(this._name, this._company,this._imgURL, this._bio);
  @override
  _speakerDetailsState createState() => _speakerDetailsState();
}

class _speakerDetailsState extends State<speakerDetails> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 40.0),
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 80.0),
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0)),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.height,
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width / 4),
                       // color: hexToColor('#4885ed'),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height,
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width / 5),
                        //color: hexToColor('#db3236'),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height,
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width / 6),
                       // color: hexToColor('#f4c20d'),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height,
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width / 9.4),
                        //color: hexToColor('#3cba54'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 5.0,
                    bottom: 5.0,
                  ),
                  child: Card(
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 120.0,
                        ),
                        Text(
                          widget._name,
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 22.0,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right:8.0,left: 8.0),
                          child: Text(
                            widget._company,
                            style: TextStyle(
                               color: hexToColor('#673ab7'),
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                        Container(
                          height: 400.0,
                          child: Scrollbar(
                            child: ScrollConfiguration(
                              behavior: MyBehavior(),
                              child: ListView(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      widget._bio,
                                      style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                               GestureDetector(child: Container(height:50.0,child: Image.asset("assets/git.png"))),
                              GestureDetector(child: Container(height:50.0,child: Image.asset("assets/fb.png"))),
                                GestureDetector(child: Container(height:50.0,child: Image.asset("assets/mail.png"))),
                                 GestureDetector(child: Container(height:50.0,child: Image.asset("assets/linkedin.png"))),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(widget._imgURL),
                radius: 60.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
