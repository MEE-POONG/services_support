import 'package:flutter/material.dart';

class Tab1 extends StatefulWidget {
  const Tab1({Key? key}) : super(key: key);

  @override
  _Tab1State createState() => _Tab1State();
}

class _Tab1State extends State<Tab1> {
  final _formkey = GlobalKey<FormState>();
  String dropdownValue = 'One';

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
            height: 200,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "1. ",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      // DropdownButton<String>(
                      //   iconSize: 30,
                      //   value: dropdownValue,
                      //   onChanged: (String? newValue) {
                      //     setState(() {
                      //       dropdownValue = newValue!;
                      //     });
                      //   },
                      //   items: <String>[
                      //     'สิทธิกร ครบกลาง T121',
                      //     'ยุรนันท์ ประจวบสุข T122',
                      //     'วราวุธ เทกระโทก T123',
                      //     'พยุงศักดิ์ ขนุนสูงเนิน T124'
                      //   ].map<DropdownMenuItem<String>>((String value) {
                      //     return DropdownMenuItem<String>(
                      //       value: value,
                      //       child: Text(value),
                      //     );
                      //   }).toList(),
                      // ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "2. ",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      // DropdownButton<String>(
                      //   value: dropdownValue,
                      //   iconSize: 30,
                      //   style: const TextStyle(
                      //       color: Colors.deepPurple, fontSize: 16),
                      //   underline: Container(
                      //     height: 1,
                      //     color: Colors.deepPurpleAccent,
                      //   ),
                      //   onChanged: (String? newValue) {
                      //     setState(() {
                      //       dropdownValue = newValue!;
                      //     });
                      //   },
                      //   items: <String>[
                      //     'สิทธิกร ครบกลาง T121',
                      //     'ยุรนันท์ ประจวบสุข T122',
                      //     'วราวุธ เทกระโทก T123',
                      //     'พยุงศักดิ์ ขนุนสูงเนิน T124'
                      //   ].map<DropdownMenuItem<String>>((String value) {
                      //     return DropdownMenuItem<String>(
                      //       value: value,
                      //       child: Text(value),
                      //     );
                      //   }).toList(),
                      // )
                    ],
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
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 150),
            child: Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: "Critical:"),
                    onChanged: (newText) {},
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: "Minor:"),
                    onChanged: (newText) {},
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: "Major:"),
                    onChanged: (newText) {},
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: "None:"),
                    onChanged: (newText) {},
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
              FlatButton(
                child: Text(
                  'ยืนยัน',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
                onPressed: () {},
              ),
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
