import 'package:flutter/material.dart';

class myButton extends StatelessWidget {
  String text;
  myButton(this.text);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 120.0, right: 120.0, top: 20.0),
      child: OutlineButton(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        color: Colors.white,
        onPressed: () {},
        borderSide: BorderSide(
          color: Colors.black87, //Color of the border
          style: BorderStyle.solid, //Style of the border
          width: 0.8, //width of the border
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.black87,
            fontSize: 20.0,
            fontFamily: 'GoogleSans',
          ),
        ),
      ),
    );
  }
}
