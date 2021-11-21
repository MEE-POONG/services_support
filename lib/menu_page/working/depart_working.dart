import 'package:flutter/material.dart';

class Depart extends StatefulWidget {
  const Depart({Key? key}) : super(key: key);

  @override
  _DepartState createState() => _DepartState();
}

class _DepartState extends State<Depart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [Text("Depa")],
      ),
    );
  }
}
