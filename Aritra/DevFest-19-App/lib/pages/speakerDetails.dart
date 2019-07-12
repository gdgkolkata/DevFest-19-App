// Flutter plugin imports
import 'package:flutter/material.dart';

// Pages import

// Utils import
import './utils/color.dart';

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

class speakerDetails extends StatefulWidget {
  String _name, _company, _imgURL, _bio;
  speakerDetails(this._name, this._company, this._imgURL, this._bio);
  @override
  speakerDetailsState createState() => speakerDetailsState();
}

class speakerDetailsState extends State<speakerDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 10.0,
                bottom: 10.0,
              ),
              child: Card(
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    // Image of the Speaker
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: CircleAvatar(
                        backgroundColor: hexToColor("#C7B7E4"),
                        backgroundImage: NetworkImage(widget._imgURL),
                        radius: 50.0,
                      ),
                    ),
                    // Name of the speaker
                    Text(
                      widget._name.length > 40
                          ? "${widget._company.substring(0, 37)}..."
                          : widget._name,
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 22.0,
                      ),
                    ),
                    // Company of the speaker
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Text(
                        widget._company.length > 90
                            ? "${widget._company.substring(0, 87)}..."
                            : widget._company,
                        style: TextStyle(
                          color: hexToColor('#673ab7'),
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                    // The description with scrollbar
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 5.0),
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
                                      color: Colors.grey.shade600,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
