import 'package:flutter/material.dart';

class Tab1 extends StatefulWidget {
  const Tab1({Key? key}) : super(key: key);

  @override
  _Tab1State createState() => _Tab1State();
}

class _Tab1State extends State<Tab1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Text("", style: TextStyle(fontSize: 20)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "",
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // ignore: deprecated_member_use
              RaisedButton(
                child: Text("เพิ่ม"),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
