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
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton(
                child: Text(
                  'Add',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
                onPressed: () {},
              ),
              FloatingActionButton(
          backgroundColor: Colors.green,
          child: Icon(Icons.map),
          onPressed: () {
            
          },
        ),
     
            ],
          ),
        ),
      ),
    );
  }
}
