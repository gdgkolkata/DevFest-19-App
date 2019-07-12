// Flutter plugin imports
import 'package:flutter/material.dart';

// Pages import

// Utils import
import './utils/color.dart';

class sessionDetails extends StatefulWidget {
  String _slot, _title, _tags, _level, _venue, _description;
  sessionDetails(this._slot, this._title, this._tags, this._level, this._venue,
      this._description);
  @override
  _sessionDetailsState createState() => _sessionDetailsState();
}

class _sessionDetailsState extends State<sessionDetails> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                widget._title,
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 30.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
              ),
              child: Row(
                children: <Widget>[
                  Icon(Icons.access_time),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget._slot == "null" ? "To be decided" : widget._slot,
                      style: TextStyle(
                        color: Colors.black87,
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
                  Icon(Icons.location_city),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget._venue == "null" ? "To be decided" : widget._venue,
                      style: TextStyle(
                        color: Colors.black87,
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
                      widget._level,
                      style: TextStyle(
                        color: Colors.black87,
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
                          : Colors.black12,
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
                          : Colors.black12,
                      child: Text("      "),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: placeTags(widget._tags),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                widget._description,
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 18.0,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.white,
        tooltip: 'Live Streaming',
        child: Icon(
          Icons.videocam,
          color: Colors.black87,
        ),
        elevation: 2.0,
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 20.0,
        child: SizedBox(
          height: 40.0,
        ),
        shape: CircularNotchedRectangle(),
        color: Colors.white,
      ),
    );
  }
}
