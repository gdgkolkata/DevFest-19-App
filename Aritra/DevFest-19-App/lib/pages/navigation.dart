// Flutter plugin imports
import 'package:dynamic_theme/dynamic_theme.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// Pages imports

// Utils imports
import './utils/drawer.dart';
import './utils/drawerInfo.dart';

class Navigation extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  GoogleMapController _controller;
  bool isMapCreated = false;

  Set<Marker> _createMarker() {
    return <Marker>[
      Marker(
        markerId: MarkerId("marker_1"),
        position: LatLng(22.5798047, 88.4610292),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueViolet,
        ),
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

  changeModeDark() {
    getJsonFile('assets/night.json').then(setmapstyle);
  }

  changeModeLight() {
    getJsonFile('assets/light.json').then(setmapstyle);
  }

  Future<String> getJsonFile(String path) async {
    return await rootBundle.loadString(path);
  }

  void setmapstyle(String mapStyle) {
    _controller.setMapStyle(mapStyle);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Theme.of(context).backgroundColor == Colors.white
          ? Colors.white10
          : Colors.black, //top bar color
      systemNavigationBarColor:
          Theme.of(context).backgroundColor == Colors.white
              ? Colors.white10
              : Colors.black, //bottom bar color
      systemNavigationBarIconBrightness:
          Theme.of(context).backgroundColor == Colors.white
              ? Brightness.dark
              : Brightness.light,
    ));
    if (isMapCreated) {
      if (Theme.of(context).backgroundColor == Colors.black) {
        changeModeDark();
      } else {
        changeModeLight();
      }
    }
    return WillPopScope(
      onWillPop: _willPopCallback,
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).backgroundColor,
          iconTheme: new IconThemeData(
              color: Theme.of(context).backgroundColor == Colors.white
                  ? Colors.grey.shade600
                  : Colors.white),
          title: Text(
            'Find Your Way',
            style: TextStyle(
              color: Theme.of(context).backgroundColor == Colors.white
                  ? Colors.grey.shade600
                  : Colors.white,
            ),
          ),
          elevation: 5.0,
          brightness: Theme.of(context).backgroundColor == Colors.white
              ? Brightness.light
              : Brightness.dark,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.lightbulb_outline),
              iconSize: 20.0,
              onPressed: () {
                DynamicTheme.of(context).setThemeData(new ThemeData(
                  backgroundColor:
                      Theme.of(context).backgroundColor == Colors.white
                          ? Colors.black
                          : Colors.white,
                ));
              },
            )
          ],
        ),
        drawer: myDrawer(),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.8,
                child: GoogleMap(
                  mapType: MapType.normal,
                  initialCameraPosition: _venue,
                  markers: _createMarker(),
                  onMapCreated: (GoogleMapController controller) {
                    _controller = controller;
                    isMapCreated = true;
                    if (Theme.of(context).backgroundColor == Colors.black) {
                      changeModeDark();
                    } else {
                      changeModeLight();
                    }
                  },
                ),
              ),
            ),
            Expanded(
              child: Text(
                "Novotel Kolkata Hotel And Residences",
                style: TextStyle(
                  color: Colors.grey.shade400,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
