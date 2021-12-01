import 'package:flutter/material.dart';

class GetLocation extends StatefulWidget {
  const GetLocation({Key? key}) : super(key: key);

  @override
  _GetLocationState createState() => _GetLocationState();
}

class _GetLocationState extends State<GetLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Text("รายละเอียดงาน", style: TextStyle(fontSize: 20)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [],
            ),
          ],
        ),
      ),
    );
  }
}
