// Flutter plugin imports
import 'package:flutter/material.dart';

// Pages import

// Utils import
import './utils/color.dart';

class sessionDetails extends StatefulWidget {
  String _slot, _title, _tags, _level, _venue, _description, _speaker;
  sessionDetails(this._speaker, this._slot, this._title, this._tags,
      this._level, this._venue, this._description);
  @override
  sessionDetailsState createState() => sessionDetailsState();
}

class sessionDetailsState extends State<sessionDetails> {
  Widget placeTags(String tags) {
    List<String> _tags;
    _tags = tags.split(",");
    return tags == ""
        ? Text("")
        : Container(
            child: Text(
              _tags.join(" | "),
              style: TextStyle(
                color: hexToColor('#673ab7'),
                fontSize: 20.0,
              ),
            ),
          );
  }

  // Dialog Box for NOT STREAMING
  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          backgroundColor: Theme.of(context).backgroundColor==Colors.white?Colors.white:Colors.grey[700],
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          title: new Text(
            "Live Stream",
            style: TextStyle(fontWeight: FontWeight.bold,),
          ),
          content: new Text(
            "Live Streaming is disabled.\nKeep an 👀 on the 4th of Aug.",
            style: TextStyle(color: Theme.of(context).backgroundColor==Colors.white?Colors.black:Colors.white,),
          ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close",style: TextStyle(color:Colors.white ),),
              color:Theme.of(context).backgroundColor==Colors.white?hexToColor("#C7B7E4"):hexToColor('#673ab7'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Theme.of(context).backgroundColor,
      body: Container(
        color: Theme.of(context).backgroundColor,
        child: ListView(
          children: <Widget>[
            // Title of the talk
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 20.0, 0.0, 10.0),
              child: Text(
                widget._title,
                style: TextStyle(
                  color: Theme.of(context).backgroundColor==Colors.white?Colors.black:Colors.white,
                  fontSize: 30.0,
                ),
              ),
            ),
            // Name of the Speaker
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 5.0),
              child: Text(
                widget._speaker,
                style: TextStyle(
                  color: Theme.of(context).backgroundColor==Colors.white?Colors.grey.shade600:Colors.grey.shade400,
                  fontSize: 25.0,
                ),
              ),
            ),
            // Tags of the talk
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: placeTags(widget._tags),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
              ),
              child: Row(
                children: <Widget>[
                  Icon(Icons.access_time,color: Theme.of(context).backgroundColor==Colors.white?Colors.black:Colors.white,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget._slot == "null"
                          ? "To be decided"
                          : widget._slot.substring(11, 16),
                      style: TextStyle(
                        color: Theme.of(context).backgroundColor==Colors.white?Colors.black:Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
              ),
              child: Row(
                children: <Widget>[
                  Icon(Icons.location_city,color: Theme.of(context).backgroundColor==Colors.white?Colors.black:Colors.white,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget._venue == "null" ? "To be decided" : widget._venue,
                      style: TextStyle(
                        color: Theme.of(context).backgroundColor==Colors.white?Colors.black:Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15.0,
              ),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Session Level : ",
                      style: TextStyle(
                        color: Theme.of(context).backgroundColor==Colors.white?Colors.black:Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget._level,
                      style: TextStyle(
                        color: Theme.of(context).backgroundColor==Colors.white?Colors.grey.shade600:Colors.grey.shade400,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Container(
                      height: 18.0,
                      color: hexToColor('#673ab7'),
                      child: Text("      "),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Container(
                      height: 18.0,
                      color: widget._level == "Intermediate" ||
                              widget._level == "Advance"
                          ? hexToColor('#673ab7')
                          : Colors.grey,
                      child: Text(
                        "      ",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Container(
                      height: 18.0,
                      color: widget._level == "Advance"
                          ? hexToColor('#673ab7')
                          : Colors.grey,
                      child: Text("      "),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                widget._description,
                style: TextStyle(
                  color: Theme.of(context).backgroundColor==Colors.white?Colors.black:Colors.grey.shade600,
                  fontSize: 18.0,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showDialog();
        },
        backgroundColor: hexToColor('#673ab7'),
        tooltip: 'Live Streaming',
        child: Icon(
          Icons.videocam,
          color: Colors.white,
        ),
        elevation: 2.0,
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 20.0,
        child: SizedBox(
          height: 40.0,
        ),
        shape: CircularNotchedRectangle(),
        color: Theme.of(context).backgroundColor==Colors.white?Colors.white:hexToColor("#212121"),
      ),
    );
  }
}
