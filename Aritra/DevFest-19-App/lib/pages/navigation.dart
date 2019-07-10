import 'dart:async';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'utils/color.dart';

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
        position: LatLng(22.5602, 88.4902),
      ),
    ].toSet();
  }

  final CameraPosition _venue = CameraPosition(
    target: LatLng(22.5602, 88.4902),
    zoom: 17.0,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: MediaQuery.of(context).size.height / 2,
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
          Container(
            height: MediaQuery.of(context).size.height * (1 / 5),
            width: MediaQuery.of(context).size.height * (1 / 5),
            child: FlareActor(
              'assets/compass2b.flr',
              animation: "dir",
              color: hexToColor("#673ab7"),
            ),
          ),
        ],
      ),
    );
  }
}
