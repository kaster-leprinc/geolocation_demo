import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

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
  String _location = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Your Location : ',
            ),
            Text(
              '$_location',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getLocation,
        tooltip: 'Increment',
        child: Icon(Icons.map),
      ),
    );
  }

  Future _getLocation() async {
    print("llamamos a getlocation");
    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() {
     _location =position.toString(); 
    });
  }
}
