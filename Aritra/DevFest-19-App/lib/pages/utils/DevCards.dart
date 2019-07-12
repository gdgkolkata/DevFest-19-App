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
    return SizedBox(
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
            // Image of the Developer
            leading: CircleAvatar(
              backgroundColor: hexToColor("#C7B7E4"),
              backgroundImage: NetworkImage(widget._imgURL),
              radius: 25.0,
            ),
            // Name of the Speaker
            title: Text(
              widget._name.length > 40
                  ? "${widget._name.substring(0, 37)}..."
                  : widget._name,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            // Name of the Company
            subtitle: Text(
              widget._company.length > 70
                  ? "${widget._company.substring(0, 67)}..."
                  : widget._company,
              style: TextStyle(
                color: Colors.grey.shade600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
