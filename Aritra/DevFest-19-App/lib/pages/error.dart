// Flutter import
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  final String message;

  const ErrorPage({Key key, this.message = "There was an unknown error."})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                      height: 100.0,
                      child: Image.asset("assets/logodevFest.png")),
                  Text(
                    message,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.red),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
