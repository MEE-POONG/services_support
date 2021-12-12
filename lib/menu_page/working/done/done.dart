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
      body: Body(),
    );
  }
}

/////////////////////////////////////////////////////
class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool isShowLocation2 = false;
  String dropdownvalue = 'เลือก';
  String _currentSubCaseValue = 'AIR';

  var items1 = [
    'AIR',
    'AIRNET',
    'EDS',
    'FBB',
    'PM',
    'Power',
    'Radio',
    'Radio(Work on Tower)',
    'Transmission',
    'WIFI'
  ];
  var items2 = [
    'Check',
    'Reset',
    'Replace',
    'Reconfig',
    'Cleaning',
    'Remove',
    'None',
    'Antenna Adjust'
  ];
  var items3 = [
    'AC Adaptor-154',
    'AP-101',
    'Core-104',
    'Effect From Customer Side-105',
    'Hub-103',
    'L2-102',
    'Optic ตอนนอกขาด-124',
    'RJ45-155'
  ];

  String get title => dropdownvalue;

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: SizedBox(
                      width: 300,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(labelText: "ระบุอาการเสีย"),
                        onChanged: (newText) {},
                      ),
                    ),
                  ),
                  Container(
                    child: SizedBox(
                      width: 50,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(labelText: "Sector"),
                        onChanged: (newText) {},
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 20,
                    height: 50,
                  ),
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
                      'Sub cause',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.grey,
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Sub cause"),
                            content: SingleChildScrollView(
                              child: Container(
                                width: double.infinity,
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: items1
                                        .map((e) => RadioListTile(
                                              title: Text(e),
                                              value: e,
                                              groupValue: _currentSubCaseValue,
                                              onChanged: (val) {
                                                setState(() {
                                                  debugPrint('VAL = $val');
                                                  _currentSubCaseValue =
                                                      val.toString();
                                                });
                                                Navigator.of(context).pop();
                                                isShowLocation2 = true;
                                              },
                                            ))
                                        .toList()),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),

                  // ignore: deprecated_member_use
                  FlatButton(
                    child: Text(
                      'Action',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.grey,
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Action"),
                            content: SingleChildScrollView(
                              child: Container(
                                width: double.infinity,
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: items2
                                        .map((e) => RadioListTile(
                                              title: Text(e),
                                              value: e,
                                              groupValue: _currentSubCaseValue,
                                              onChanged: (val) {
                                                setState(() {
                                                  debugPrint('VAL = $val');
                                                  _currentSubCaseValue =
                                                      val.toString();
                                                });
                                                Navigator.of(context).pop();
                                                isShowLocation2 = true;
                                              },
                                            ))
                                        .toList()),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                  // ignore: deprecated_member_use
                  FlatButton(
                      child: Text(
                        'Fault type',
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.grey,
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Fault Type"),
                              content: SingleChildScrollView(
                                child: Container(
                                  width: double.infinity,
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: items3
                                          .map((e) => RadioListTile(
                                                title: Text(e),
                                                value: e,
                                                groupValue:
                                                    _currentSubCaseValue,
                                                onChanged: (val) {
                                                  setState(() {
                                                    debugPrint('VAL = $val');
                                                    _currentSubCaseValue =
                                                        val.toString();
                                                  });
                                                  Navigator.of(context).pop();
                                                  isShowLocation2 = true;
                                                },
                                              ))
                                          .toList()),
                                ),
                              ),
                            );
                          },
                        );
                      }),
                ],
              ),

              RowWidget(),
              // ignore: dead_code
              isShowLocation2 ? SizedBox1() : Text(""),
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
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _singleNotifier {
  static var currentCountry;
  static void updateCountry(Object? value) {}
}

Widget RowWidget() {
  return Row();
}

// ignore: non_constant_identifier_names
Widget SizedBox1() {
  var _formkey;
  return Container(
    child: Form(
      key: _formkey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text(
              "อุปกรณ์ที่เปลี่ยน(ห้ามแก้ไขชื่อ Spare ถ้ามีเพิ่มเติมให้ใส่เครื่องหมาย,คั้น)",
              style: TextStyle(fontSize: 13),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: SizedBox(
                  width: 250,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: "AP"),
                    onChanged: (newText) {},
                  ),
                ),
              ),
              Container(
                child: SizedBox(
                  width: 100,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: "จำนวน"),
                    onChanged: (newText) {},
                  ),
                ),
              ),
            ],
          ),
         
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text("Equipment move in Serial No.(ของดี>เปลี่ยนเข้า)",
                style: TextStyle(fontSize: 13)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: SizedBox(
                  width: 250,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: "Serial In:"),
                    onChanged: (newText) {},
                  ),
                ),
              ),
              FlatButton(
                child: Text(
                  'Scan In',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.grey,
                onPressed: () {},
              )
            ],
          ),
         
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text("Equipment move Out Serial No.(ของเสีย>เปลี่ยนออก)",
                style: TextStyle(fontSize: 13)),
          ),
          Row(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: SizedBox(
                  width: 250,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: "Serial Out::"),
                    onChanged: (newText) {},
                  ),
                ),
              ),
              FlatButton(
                child: Text(
                  'Scan Out',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.grey,
                onPressed: () {},
              )
            ],
          ),
        ],
      ),
    ),
  );
}
