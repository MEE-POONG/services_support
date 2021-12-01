import 'package:flutter/material.dart';

class Depart extends StatefulWidget {
  const Depart({Key? key}) : super(key: key);

  @override
  _DepartState createState() => _DepartState();
}

class _DepartState extends State<Depart> {
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
