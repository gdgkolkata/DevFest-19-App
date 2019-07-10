// Flutter plugin imports
import 'package:flutter/material.dart';

// Pages import

// Utils import
import './utils/color.dart';

class speakerDetails extends StatefulWidget {
  String _name, _company, _imgURL;
  speakerDetails(this._name, this._company, this._imgURL);
  @override
  _speakerDetailsState createState() => _speakerDetailsState();
}

class _speakerDetailsState extends State<speakerDetails> {
  String details =
      "Sundar Pichai is a computer engineer and the current CEO of Google Inc. The technology giant Google, which specializes in Internet-related services and products, underwent a major corporate restructuring in 2015 following which Alphabet Inc was launched as its parent company with co-founders Larry Page as its CEO and Sergey Brin as President. Pichai, who had been serving as Google’s head of Products and Engineering, was named the new CEO of Google which is the biggest company under Alphabet Inc.";
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
                    children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.height,
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width / 4),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height,
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width / 5),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height,
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width / 6),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height,
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width / 9.4),
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
                        Text(
                          widget._name,
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 25.0,
                          ),
                        ),
                        Text(
                          widget._company,
                          style: TextStyle(
                            color: hexToColor('#673ab7'),
                            fontSize: 20.0,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            details,
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            GestureDetector(
                                child: Container(
                                    height: 50.0,
                                    child: Image.asset("assets/git.png"))),
                            GestureDetector(
                                child: Container(
                                    height: 50.0,
                                    child: Image.asset("assets/fb.png"))),
                            GestureDetector(
                                child: Container(
                                    height: 50.0,
                                    child: Image.asset("assets/mail.png"))),
                            GestureDetector(
                                child: Container(
                                    height: 50.0,
                                    child: Image.asset("assets/linkedin.png"))),
                          ],
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
