import 'package:flutter/material.dart';
import 'package:maps_launcher/maps_launcher.dart';

class Depart extends StatefulWidget {
  const Depart({Key? key}) : super(key: key);

  @override
  _DepartState createState() => _DepartState();
}

class _DepartState extends State<Depart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => MapsLauncher.launchQuery(
                  '1600 Amphitheatre Pkwy, Mountain View, CA 94043, USA'),
              child: Text('LAUNCH QUERY'),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () => MapsLauncher.launchCoordinates(
                  37.4220041, -122.0862462, 'Google Headquarters are here'),
              child: Text('LAUNCH COORDINATES'),
            ),
          ],
        ),
      ),
    );
  }
}
