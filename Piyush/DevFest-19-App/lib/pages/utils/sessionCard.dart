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

  Widget placeTags(String tags) {
    List<String> _tags;
    _tags = tags.split(",");
    return tags == ""
        ? Container()
        : Container(
            child: Text(
              _tags.join(" | "),
              style: TextStyle(
                color: hexToColor('#673ab7'),
                fontSize: 15.0,
              ),
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 5,
        child: Card(
          elevation: 5.0,
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Center(
            child: ListTile(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              leading: Text(
                widget._slot == "null" ? "Time" : widget._slot,
                style: TextStyle(color: hexToColor("#C7B7E4")),
              ),
              // Title of the session
              title: Text(
                widget._title.length > 50
                    ? "${widget._title.substring(0, 47)}..."
                    : widget._title,
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
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
                  color: Colors.grey.shade600, size: 30.0),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => sessionDetails(
                            widget._slot,
                            widget._title,
                            widget._tags,
                            widget._level,
                            widget._venue,
                            widget._description)));
              },
            ),
          ),
        ),
      ),
    );

    // return Container(
    //   height: MediaQuery.of(context).size.height / 4,
    //   width: MediaQuery.of(context).size.width - 20,
    //   child: GestureDetector(
    //     child: Padding(
    //       padding: const EdgeInsets.all(8.0),
    //       child: Card(
    //         elevation: 5.0,
    //         shape: RoundedRectangleBorder(
    //             borderRadius: BorderRadius.circular(10.0)),
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //           children: <Widget>[
    //             Container(
    //               width: 300.0,
    //               child: Column(
    //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                 children: <Widget>[
    //                   Text(
    //                     widget._slot,
    //                     style: TextStyle(
    //                       color: hexToColor('#673ab7'),
    //                       fontSize: 12.0,
    //                     ),
    //                   ),
    //                   Text(
    //                     widget._title,
    //                     style: TextStyle(
    //                       color: Colors.black87,
    //                       fontSize: 22.0,
    //                     ),
    //                   ),
    //                   Text(
    //                     widget._speaker,
    //                     style: TextStyle(
    //                       color: Colors.black38,
    //                       fontSize: 16.0,
    //                     ),
    //                   ),
    //                   placeTags(widget._tags),
    //                 ],
    //               ),
    //             ),
    //             Icon(Icons.keyboard_arrow_right,
    //                 color: Colors.grey.shade600, size: 30.0),
    //           ],
    //         ),
    //       ),
    //     ),
    // onTap: () {
    //   Navigator.push(
    //       context,
    //       MaterialPageRoute(
    //           builder: (context) => sessionDetails(
    //               widget._slot,
    //               widget._title,
    //               widget._tags,
    //               widget._level,
    //               widget._venue,
    //               widget._description)));
    // },
    //   ),
    // );
  }
}
