// Flutter plugin imports
import 'package:flutter/material.dart';

// Pages import
import 'package:devfest19/pages/speakerDetails.dart';

class SpeakerCards extends StatefulWidget {
  String _name, _company, _session, _imgURL, _bio;
  SpeakerCards(
      this._name, this._company, this._session, this._imgURL, this._bio);
  @override
  _SpeakerCardsState createState() => _SpeakerCardsState();
}

class _SpeakerCardsState extends State<SpeakerCards> {
  Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
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
                // Image of the Speaker
                leading: CircleAvatar(
                  backgroundColor: hexToColor("#C7B7E4"),
                  backgroundImage: NetworkImage(widget._imgURL),
                  radius: 25.0,
                ),
                // Name of the Speaker
                title: Text(
                  widget._name.length > 40
                      ? "${widget._company.substring(0, 37)}..."
                      : widget._name,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
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
                // The go Arrow
                trailing: Icon(Icons.keyboard_arrow_right,
                    color: Colors.grey.shade600, size: 30.0)),
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => speakerDetails(widget._name,
                    widget._company, widget._imgURL, widget._bio)));
      },
    );
  }
}
