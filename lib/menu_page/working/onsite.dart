import 'package:flutter/material.dart';

class Onsite extends StatefulWidget {
  const Onsite({Key? key}) : super(key: key);

  @override
  _OnsiteState createState() => _OnsiteState();
}

class _OnsiteState extends State<Onsite> {
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
