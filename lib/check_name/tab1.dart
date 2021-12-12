import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Tab1 extends StatefulWidget {
  const Tab1({Key? key}) : super(key: key);

  @override
  _Tab1State createState() => _Tab1State();
}

class _Tab1State extends State<Tab1> {
  final _formkey = GlobalKey<FormState>();
  //final FirebaseAuth _auth = FirebaseAuth.instance;
  final Stream<QuerySnapshot> _worksStream =
      FirebaseFirestore.instance.collection('work').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 0),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.deepPurple, Colors.lightBlue],
              ),
            ),
            height: 50,
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Text(
                  "แจ้งรายชื่อผู้ปฏิบัติงานประจำวันที่:",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ],
            ),
          ),
          Container(
            height: 280,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SingleChildScrollView(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "1. ",
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                        Container(
                          child: SizedBox(
                            width: 220,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(labelText: ""),
                              onChanged: (newText) {},
                            ),
                          ),
                        ),
                        FlatButton(
                          child: Text(
                            'Add',
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.grey,
                          onPressed: () {},
                        )
                      ],
                    ),
                  ),
                 
                  SingleChildScrollView(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "2. ",
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                        Container(
                          child: SizedBox(
                            width: 220,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(labelText: ""),
                              onChanged: (newText) {},
                            ),
                          ),
                        ),
                        FlatButton(
                          child: Text(
                            'Add',
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.grey,
                          onPressed: () {},
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.deepPurple, Colors.lightBlue],
              ),
            ),
            height: 50,
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Text(
                  "ใบงานทั้งหมดในSMS",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ],
            ),
          ),
          Container(
            child: Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        child: SizedBox(
                          width: 150,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(labelText: "Critical:"),
                            onChanged: (newText) {},
                          ),
                        ),
                      ),
                      Container(
                        child: SizedBox(
                          width: 150,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(labelText: "Minor:"),
                            onChanged: (newText) {},
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        child: SizedBox(
                          width: 150,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(labelText: "Major:"),
                            onChanged: (newText) {},
                          ),
                        ),
                      ),
                      Container(
                        child: SizedBox(
                          width: 150,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(labelText: "None:"),
                            onChanged: (newText) {},
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(value: false, onChanged: (value) {}),
              Text("พร้อมรับงาน"),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // ignore: deprecated_member_use
              FlatButton(
                child: Text(
                  'ยืนยัน',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
                onPressed: () {},
              ),
              // ignore: deprecated_member_use
              FlatButton(
                child: Text(
                  'Get location',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
