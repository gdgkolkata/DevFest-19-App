import 'package:devfest19/data/sessionDetails.dart';
import 'package:flutter/material.dart';
import './color.dart';
class SessionCard extends StatefulWidget {
   bool _isAdded, _isBookmarked;
   String _slot,_title,_speaker,_tags,_level,_venue;
  SessionCard(this._isAdded,this._isBookmarked,this._slot,this._title,this._speaker,this._tags,this._level,this._venue);
  @override
  _SessionCardState createState() => _SessionCardState();
}

class _SessionCardState extends State<SessionCard> {
  Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }
  Widget placeTags(String tags) {
    List<String>_tags;
    _tags=tags.split(",");
    return tags==""?Container():Container(
            child: Text(
                _tags.join(" | "),
                style: TextStyle(
                  color: hexToColor('#4885ed'),
                  fontSize: 15.0,
                ),
              ),
    );
  }
  @override
  Widget build(BuildContext context) {
          return Container(
            height: MediaQuery.of(context).size.height / 4,
            width: MediaQuery.of(context).size.width-20,
            child: GestureDetector(
              child: Padding(
                padding: const EdgeInsets.only(top:8.0,bottom: 8.0,),
                child: Card(
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 2.5 * MediaQuery.of(context).size.width/3.2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                              widget._slot,
                              style: TextStyle(
                                color: hexToColor('#4885ed'),
                                fontSize: 15.0,
                              ),
                            ),
                            Text(
                              widget._title,
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 25.0,
                              ),
                            ),
                            Text(
                              widget._speaker,
                              style: TextStyle(
                                color: Colors.black38,
                                fontSize: 20.0,
                              ),
                            ),
                            placeTags(widget._tags),
                          ],
                        ),
                      ),
                      Container(
                        // color: Colors.blue[50],
                        color: hexToColor("#CBC5D7"),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            IconButton(
                              icon: widget._isBookmarked == false
                                  ? Icon(Icons.bookmark_border)
                                  : Icon(Icons.bookmark),
                              color: hexToColor('#673ab7'),
                              onPressed: () {
                                setState(() {
                                  if (!widget._isBookmarked)
                                    widget._isBookmarked = true;
                                  else
                                   widget._isBookmarked = false;
                                });
                              },
                            ),
                            IconButton(
                              icon: widget._isAdded == false
                                  ? Icon(Icons.star_border)
                                  : Icon(Icons.star),
                              color: hexToColor('#673ab7'),
                              onPressed: () {
                                setState(() {
                                  if (!widget._isAdded)
                                    widget._isAdded = true;
                                  else
                                    widget._isAdded = false;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              onTap: (){
                 Navigator.push(context,
                    MaterialPageRoute(builder: (context) => sessionDetails(widget._slot,widget._title,widget._speaker,widget._tags,widget._level,widget._venue)));
              },
            ),
          );
  }
}