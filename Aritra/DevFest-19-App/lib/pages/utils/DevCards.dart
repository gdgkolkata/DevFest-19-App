// Flutter imports
import 'package:flutter/material.dart';

class DevCards extends StatefulWidget {
  String _name, _company, _imgURL;
  DevCards(this._name, this._company, this._imgURL);
  @override
  _DevCardsState createState() => _DevCardsState();
}

class _DevCardsState extends State<DevCards> {
  Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Container(
            height: MediaQuery.of(context).size.height / 5,
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 150,
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
                              color: hexToColor("#673ab7"),
                              fontSize: 20.0,
                            ),
                          ),
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
            backgroundColor: hexToColor("#C7B7E4"),
            backgroundImage: NetworkImage(widget._imgURL),
            radius: 60.0,
          ),
        ),
      ],
    );
  }
}
