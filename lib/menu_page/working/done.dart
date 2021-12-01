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
      body: Container(
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
                Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
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
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                textAlign: TextAlign.center,
                onChanged: (newText) {},
              ),
            ),
            // ignore: deprecated_member_use
            FlatButton(
              child: Text(
                'Sector',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () {},
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                Text(
                  "การแก้ไข",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                textAlign: TextAlign.center,
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
              children: [
                Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                Text(
                  "หมายเหตุ:",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
           SizedBox(height: 40,),
            Text(
              'ช่วยสร้าง Problem cause',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // ignore: deprecated_member_use
                FlatButton(
                  child: Text(
                    'เลือก Sub cause',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.blue,
                  onPressed: () {},
                ),
                // ignore: deprecated_member_use
            FlatButton(
              child: Text(
                'Action',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () {},
            ),
            // ignore: deprecated_member_use
            FlatButton(
              child: Text(
                'Fault type',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () {},
            ),
              ],
            ),
            SizedBox(height: 40,),
            // ignore: deprecated_member_use
            FlatButton(
              child: Text(
                'ส่งรางาน',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
