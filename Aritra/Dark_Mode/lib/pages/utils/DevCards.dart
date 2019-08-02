// Flutter imports
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DevCards extends StatefulWidget {
  String _name, _company, _imgURL, _github;
  DevCards(this._name, this._company, this._imgURL, this._github);
  @override
  _DevCardsState createState() => _DevCardsState();
}

class _DevCardsState extends State<DevCards> {
  Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 5,
      child: Card(
        color: Colors.black,
        elevation: 5.0,
        margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(color: Colors.white, width: 0.2),
        ),
        child: Center(
          child: GestureDetector(
            onTap: () async {
              String url = widget._github;
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'Could not launch $url';
              }
            },
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
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              // Name of the Company
              subtitle: Text(
                widget._company.length > 70
                    ? "${widget._company.substring(0, 67)}..."
                    : widget._company,
                style: TextStyle(
                  color: Colors.grey.shade400,
                ),
              ),
              // The github logo
              trailing: Image.asset(
                "assets/github.png",
                color: Colors.grey.shade400,
                height: 20.0,
                width: 20.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
