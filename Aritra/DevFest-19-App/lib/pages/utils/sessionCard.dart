import 'package:devfest19/pages/sessionDetails.dart';
import 'package:flutter/material.dart';

class SessionCard extends StatefulWidget {
  bool _isAdded, _isBookmarked;
  String _slot, _title, _speaker, _tags, _level, _venue, _description;
  SessionCard(this._isAdded, this._isBookmarked, this._slot, this._title,
      this._speaker, this._tags, this._level, this._venue, this._description);
  @override
  _SessionCardState createState() => _SessionCardState();
}

class _SessionCardState extends State<SessionCard> {
  Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: MediaQuery.of(context).size.height / 5,
        child: Card(
          color: Theme.of(context).backgroundColor,
          elevation: 5.0,
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            // side: BorderSide(color: Colors.white, width: 0.2),
            side: widget._description != "null"
                ? (Theme.of(context).backgroundColor == Colors.black
                    ? BorderSide(color: Colors.white, width: 0.2)
                    : BorderSide(color: Colors.white, width: 0.2))
                :(Theme.of(context).backgroundColor == Colors.black
                    ? BorderSide(color: Colors.black, width: 0.2)
                    : BorderSide(color: Colors.white, width: 0.2)),
          ),
          child: Center(
            child: ListTile(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              // Slot
              leading: CircleAvatar(
                backgroundColor: hexToColor("#C7B7E4"),
                radius: 25.0,
                child: Text(
                  widget._slot == "null"
                      ? "--:--"
                      : widget._slot.substring(11, 16),
                  style: TextStyle(
                      color: Theme.of(context).backgroundColor == Colors.white
                          ? Colors.white
                          : Colors.black),
                ),
              ),
              // Title of the session
              title: Text(
                widget._title.length > 50
                    ? "${widget._title.substring(0, 47)}..."
                    : widget._title,
                style: TextStyle(
                    color: Theme.of(context).backgroundColor == Colors.white
                        ? Colors.black
                        : Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              // Speaker
              subtitle: Text(
                widget._speaker.length > 50
                    ? "${widget._speaker.substring(0, 47)}..."
                    : widget._speaker,
                style: TextStyle(
                    color: Colors.grey.shade600, fontWeight: FontWeight.bold),
              ),
              // The Go button
              trailing: Icon(Icons.keyboard_arrow_right,
                  color: widget._description != "null"
                      ? Colors.grey.shade600
                      : Theme.of(context).backgroundColor,
                  size: 30.0),

              onTap: widget._description != "null"
                  ? () {
                      if (widget._description != "null") {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => sessionDetails(
                                    widget._speaker,
                                    widget._slot,
                                    widget._title,
                                    widget._tags,
                                    widget._level,
                                    widget._venue,
                                    widget._description)));
                      }
                    }
                  : null,
            ),
          ),
        ),
      ),
    );
  }
}
