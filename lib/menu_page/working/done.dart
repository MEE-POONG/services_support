import 'package:flutter/material.dart';

class Done extends StatefulWidget {
  const Done({Key? key}) : super(key: key);

  @override
  _DoneState createState() => _DoneState();
}

class _DoneState extends State<Done> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Text(
                'สรุปผลการซ่อม',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.blue,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 10)),
                  Text(
                    "อาการเสียที่ตรวจพบ:",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                child: TextField(
                  decoration: InputDecoration(labelText: "ระบุอาการเสีย"),
                  textAlign: TextAlign.start,
                  onChanged: (newText) {},
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 80),
                child: TextField(
                  decoration: InputDecoration(labelText: "Sector"),
                  textAlign: TextAlign.start,
                  onChanged: (newText) {},
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 30, horizontal: 10)),
                  Text(
                    "การแก้ไข:",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                child: TextField(
                  decoration: InputDecoration(labelText: "ระบุการแก้ไข"),
                  // textAlign: TextAlign.center,
                  onChanged: (newText) {},
                ),
              ),
              Text(
                'สรุปรายงาน',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.blue,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Checkbox(
                    value: false,
                    onChanged: (value) {},
                  ),
                  Text("ปฏิบัติงานบนที่สูง"),
                  Checkbox(
                    value: false,
                    onChanged: (value) {},
                  ),
                  Text("เทปพันสาย"),
                  Checkbox(
                    value: false,
                    onChanged: (value) {},
                  ),
                  Text("Spare part"),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Checkbox(
                    value: false,
                    onChanged: (value) {},
                  ),
                  Text("Alarm clear"),
                  Checkbox(
                    value: false,
                    onChanged: (value) {},
                  ),
                  Text("ต้องใช้กุญแจ"),
                  Checkbox(
                    value: false,
                    onChanged: (value) {},
                  ),
                  Text("ปั่นไฟ"),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Checkbox(
                    value: false,
                    onChanged: (value) {},
                  ),
                  Text("เป็นข้อผิดพลาดจากการติดตั้ง"),
                ],
              ),

              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                child: TextField(
                  decoration: InputDecoration(labelText: "หมายเหตุ:"),
                  textAlign: TextAlign.start,
                  onChanged: (newText) {},
                ),
              ),

              SizedBox(
                height: 10,
              ),
              Text(
                'ช่วยสร้าง Problem cause',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // ignore: deprecated_member_use
                  FlatButton(
                    child: Text(
                      'เลือก Sub cause',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.grey,
                    onPressed: () {},
                  ),
                  // ignore: deprecated_member_use
                  FlatButton(
                    child: Text(
                      'Action',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.grey,
                    onPressed: () {},
                  ),
                  // ignore: deprecated_member_use
                  FlatButton(
                    child: Text(
                      'Fault type',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.grey,
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              // ignore: deprecated_member_use
              FlatButton(
                child: Text(
                  'ส่งรายงาน',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
