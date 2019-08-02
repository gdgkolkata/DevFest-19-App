// Flutter plugin imports
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// Pages import

// Utils import
import './utils/color.dart';
import 'package:devfest19/data/speaker.dart';

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

class speakerDetails extends StatefulWidget {
  String _name, _company, _imgURL, _bio;
  List<Link> links;
  speakerDetails(
      this._name, this._company, this._imgURL, this._bio, this.links);
  @override
  speakerDetailsState createState() => speakerDetailsState();
}

class speakerDetailsState extends State<speakerDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Theme.of(context).backgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 10.0,
                bottom: 10.0,
              ),
              child: Card(
                color:Theme.of(context).backgroundColor,
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(color: Colors.white,width: 0.2)),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    // Image of the Speaker
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: CircleAvatar(
                        backgroundColor: hexToColor("#C7B7E4"),
                        backgroundImage: NetworkImage(widget._imgURL),
                        radius: 50.0,
                      ),
                    ),
                    // Name of the speaker
                    Text(
                      widget._name.length > 40
                          ? "${widget._company.substring(0, 37)}..."
                          : widget._name,
                      style: TextStyle(
                        color: Theme.of(context).backgroundColor==Colors.white?Colors.black:Colors.white,
                        fontSize: 22.0,
                      ),
                    ),
                    // Company of the speaker
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Text(
                        widget._company,
                        style: TextStyle(
                          color: hexToColor('#673ab7'),
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                    // The description with scrollbar
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 5.0),
                        child: Scrollbar(
                          child: ScrollConfiguration(
                            behavior: MyBehavior(),
                            child: ListView(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    widget._bio,
                                    style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    //Social Media links
                    Row(
                      // crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[getSocialMediaProfiles()],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget getSocialMediaProfiles() {
    List<Widget> widgets = new List<Widget>();
    List<Link> links = widget.links;
    for (var i = 0; i < links.length; i++) {
      Widget w = new GestureDetector(
          onTap: () async {
            var url = links[i].link;
            print("URL: " + url);
            if (await canLaunch(url)) {
              await launch(url);
            } else {
              throw 'Could not launch $url';
            }
          },
          child: new Container(
              width: 40, //from 50
              height: 40, //from 50
              padding: const EdgeInsets.all(8.0),
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: getImage(links[i].title)));
      widgets.add(w);
    }
    return new Row(children: widgets);
  }

  Image getImage(String title) {
    switch (title) {
      case "Blog":
        {
          return Image.asset("assets/blogging.png");
        }
      case "Company Website":
        {
          return Image.asset("assets/domain.png");
        }
      case "LinkedIn":
        {
          return Image.asset("assets/linkedin.png");
        }
      case "Twitter":
        {
          return Image.asset("assets/twitter.png");
        }
      default:
        {
          return Image.asset("assets/worldwide.png");
        }
    }
  }
}
