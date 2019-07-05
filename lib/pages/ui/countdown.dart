import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class countDown extends StatefulWidget {
  @override
  _countDownState createState() => _countDownState();
}

class _countDownState extends State<countDown> {
  Color hexToColor(String code) {
  return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);}

  int estimateTs =
      DateTime(2019, 8, 3, 10, 00, 00).millisecondsSinceEpoch; // set schedule
  
  @override
  Widget build(BuildContext context) {
    //Countdown
    return StreamBuilder(
        stream: Stream.periodic(Duration(seconds: 1), (i) => i),
        builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
          DateFormat format = DateFormat("hh:mm:ss");
          int now = DateTime.now().millisecondsSinceEpoch;
          Duration remaining = Duration(milliseconds: estimateTs - now);
          int daysString = remaining.inDays;
          int hoursString = remaining.inHours - daysString * 24;
          int minsString =
              remaining.inMinutes - daysString * 24 * 60 - hoursString * 60;
          int secString = remaining.inSeconds -
              daysString * 24 * 60 * 60 -
              hoursString * 60 * 60 -
              minsString * 60;
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        daysString.toString() + " D",
                        style: TextStyle(
                          color: hexToColor('#db3236'),
                          fontSize: 60.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'SummerLight',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        hoursString.toString() + " H",
                        style: TextStyle(
                          color: hexToColor('#f4c20d'),
                          fontSize: 60.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'SummerLight',
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        minsString.toString() + " M",
                        style: TextStyle(
                          color: hexToColor('#4885ed'),
                          fontWeight: FontWeight.bold,
                          fontSize: 60.0,
                          fontFamily: 'SummerLight',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        secString.toString() + " S",
                        style: TextStyle(
                          color: hexToColor('#3cba54'),
                          fontWeight: FontWeight.bold,
                          fontSize: 60.0,
                          fontFamily: 'SummerLight',
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
      
  