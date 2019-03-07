import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Completer<GoogleMapController> _controller = Completer();
  GoogleMapController gmController;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.green,
        appBar: AppBar(
          title: Text("AAAA"),
        ),
        body: ListView(
          children: <Widget>[
            _buildRedContainer(),
            SizedBox( height: 20.0),
            _buildMap(),
            SizedBox( height: 20.0),
            _buildRedContainer(),
            SizedBox( height: 20.0),
            _buildRedContainer(),
            SizedBox( height: 20.0),
            _buildRedContainer(),
            SizedBox( height: 20.0),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: _goToLocation,
          label: Text('Our position'),
          icon: Icon(Icons.directions),
        ),
      ),
    );
  }

  Widget _buildRedContainer() {
    return Container(
      height: 75,
      width: double.infinity,
      color: Colors.red,
      child: Center(child: Text("aquí habría botones")),
    );
  }

  Widget _buildMap() {
    var getInitPos = _getInitPos();
    return Center(
      child: Container(
        height: 300,
        width: 300,
        child: GoogleMap(
          mapType: MapType.terrain,
          initialCameraPosition: getInitPos,
          onMapCreated: (controller){
          setState(() {
           gmController = controller;
          //  _goToLocation();
          });
        },),
      ),
    );
  }

  CameraPosition _getInitPos() {
    // Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    return CameraPosition(
        target: LatLng(28.099076704839632, -15.419923432062603), zoom: 17.9);
  }

  Future _goToLocation() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position);
    CameraPosition myLocation = CameraPosition(
        target: LatLng(position.latitude, position.longitude), zoom: 17.9);

    gmController.animateCamera(CameraUpdate.newCameraPosition(myLocation));
    //gmController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(0,0))));
  }
}
