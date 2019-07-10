import 'package:flutter/material.dart';
import 'package:devfest19/pages/speakerDetails.dart';
class SpeakerCards extends StatefulWidget {
  String _name, _company, _session, _imgURL;
  SpeakerCards(this._name, this._company, this._session, this._imgURL);
  @override
  _SpeakerCardsState createState() => _SpeakerCardsState();
}

class _SpeakerCardsState extends State<SpeakerCards> {
  Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top:30.0),
          child: Container(
            height: MediaQuery.of(context).size.height / 5,
            width: MediaQuery.of(context).size.width,
            child: GestureDetector(
              child: Card(
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0)),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height/5,
                      child: SizedBox(width:MediaQuery.of(context).size.width/4),
                      //color:  hexToColor("#673ab7"),
                    ),
                    Container(
                       height: MediaQuery.of(context).size.height/5,
                      child: SizedBox(width:MediaQuery.of(context).size.width/5),
                      //color:  hexToColor("#673ab7"),
                    ),
                    Container(
                       height: MediaQuery.of(context).size.height/5,
                      child: SizedBox(width:MediaQuery.of(context).size.width/6),
                      //color:  hexToColor("#673ab7"),
                    ),
                    Container(
                       height: MediaQuery.of(context).size.height/5,
                      child: SizedBox(width:MediaQuery.of(context).size.width/9.4),
                      //color:  hexToColor("#673ab7"),
                    ),
                  ],
                ),
              ),
              onTap: () {},
            ),
          ),
        ),
        //
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Container(
            height: MediaQuery.of(context).size.height / 5,
            width: MediaQuery.of(context).size.width,
            child: GestureDetector(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 5.0,
                  bottom: 5.0,
                ),
                child: Card(
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 150,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                color:  hexToColor("#673ab7"),
                                fontSize: 20.0,
                              ),
                            ),
                            Text(
                              widget._session,
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 18.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => speakerDetails(widget._name,widget._company,widget._imgURL)));
              },
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
    );
  }
}
