// Flutter plugin imports
import 'dart:async';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// Pages imports

// Utils imports
import './utils/drawer.dart';
import './utils/drawerInfo.dart';
import './utils/color.dart';

class Navigation extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _createMarker() {
    return <Marker>[
      Marker(
        markerId: MarkerId("marker_1"),
        position: LatLng(22.5798047, 88.4610292),
      ),
    ].toSet();
  }

  final CameraPosition _venue = CameraPosition(
    target: LatLng(22.5798047, 88.4610292),
    zoom: 18.0,
  );

  // Method which executes on pushing "Back Button"
  Future<bool> _willPopCallback() async {
    // Puts the flag up for "home", in drawer
    selection(0);
    // Pops until the last page remain
    Navigator.popUntil(context, ModalRoute.withName('/'));
    return false; // return true if the route to be popped
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _willPopCallback,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: new IconThemeData(color: Colors.black87),
          title: Text(
            'Find Your Way',
            style: TextStyle(
              color: Colors.black87,
            ),
          ),
          elevation: 5.0,
          backgroundColor: Colors.white,
        ),
        drawer: myDrawer(),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.7,
                child: GoogleMap(
                  mapType: MapType.normal,
                  initialCameraPosition: _venue,
                  markers: _createMarker(),
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                ),
              ),
            ),
            Expanded(
              // child: FlareActor(
              //   'assets/compass2b.flr',
              //   animation: "dir",
              //   color: hexToColor("#673ab7"),
              // ),
              child: Text(
                "Novotel Kolkata Hotel And Residences",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 25.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
