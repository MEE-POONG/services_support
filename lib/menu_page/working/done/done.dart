import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:services_support/menu_page/report.dart';

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
  bool checkBox0 = false;
  bool checkBox1 = false;
  bool checkBox2 = false;
  bool checkBox3 = false;
  bool checkBox4 = false;
  bool checkBox5 = false;
  bool checkBox6 = false;

  String dropdownvalue = 'เลือก';
  String _currentSubCaseValue = '';
  String _currentActionValue = '';
  String _currentFaulttypeValue = '';

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
    'Ef From Customer Side-105',
    'Hub-103',
    'L2-102',
    'Optic ตอนนอกขาด-124',
    'RJ45-155'
  ];
  var items4 = [
    'PM3-20',
    'PM5-21',
    'RECTIFIER UNIT FAILED-3',
    'SA-17',
    'SA3-19',
    'SE-18',
    'SFP BBU 10G 10KM-26',
    'SFP BBU 10G 15KM-27',
    'SFP BBU 2.5G 15KM-22',
    'SFP BBU 2.5G 2KM-128',
    'SFP BBU 6G 1.4KM-23',
    'SFP BBU 6G 10KM-25',
    'SFP BBU 6G 15KM-133',
    'SFP BBU 6G 2KM-24',
    'UTP-123'
  ];
  var items5 = [
    'ABIA-28',
    'AMIA-135',
    'ASIA-117',
    'Aoto clear-116',
    'BBU-4',
    'BPK-9',
    'BPK_d-10',
    'BPN2-11',
    'CB TRIP-161',
    'CC16B-7',
    'CC17B-6',
    'CC2-5',
    'CCE1-8',
    'Control RECTIFIER FAILED-2',
    'CR0-16',
    'Door open-1',
    'FC Adaptor(แกนI)-144',
    'FOUA 9.8G/20KM-156',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];

  String get title => dropdownvalue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
            SizedBox(height: 10),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text("อาการเสียที่ตรวจพบ:",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                      )),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: SizedBox(
                    width: 280,
                    height: 40,
                    child: TextFormField(
                      decoration: InputDecoration(hintText: "ระบุอาการเสีย"),
                      onChanged: (newText) {},
                    ),
                  ),
                ),
                Container(
                  child: SizedBox(
                    width: 50,
                    height: 40,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(hintText: "Sector"),
                      onChanged: (newText) {},
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text("การแก้ไข:",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                      )),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
              child: TextField(
                decoration: InputDecoration(hintText: "ระบุการแก้ไข"),
                // textAlign: TextAlign.center,
                onChanged: (newText) {},
              ),
            ),
            SizedBox(
              height: 10,
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
                  value: checkBox0,
                  onChanged: (value) {
                    setState(() {
                      this.checkBox0 = value!;
                    });
                  },
                ),
                Text("ปฏิบัติงานบนที่สูง"),
                Checkbox(
                  value: checkBox1,
                  onChanged: (value) {
                    setState(() {
                      this.checkBox1 = value!;
                    });
                  },
                ),
                Text("เทปพันสาย"),
                Checkbox(
                  value: checkBox2,
                  onChanged: (value) {
                    setState(() {
                      this.checkBox2 = value!;
                    });
                  },
                ),
                Text("Spare part"),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Checkbox(
                  value: checkBox3,
                  onChanged: (value) {
                    setState(() {
                      this.checkBox3 = value!;
                    });
                  },
                ),
                Text("Alarm clear      "),
                Checkbox(
                  value: checkBox4,
                  onChanged: (value) {
                    setState(() {
                      this.checkBox4 = value!;
                    });
                  },
                ),
                Text("ต้องใช้กุญแจ"),
                Checkbox(
                  value: checkBox5,
                  onChanged: (value) {
                    setState(() {
                      this.checkBox5 = value!;
                    });
                  },
                ),
                Text("ปั่นไฟ"),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Checkbox(
                  value: checkBox6,
                  onChanged: (value) {
                    setState(() {
                      this.checkBox6 = value!;
                    });
                  },
                ),
                Text("เป็นข้อผิดพลาดจากการติดตั้ง"),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
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
            SingleChildScrollView(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // ignore: deprecated_member_use
                  FlatButton(
                    minWidth: 0,
                    child: Text(
                      _currentSubCaseValue.isEmpty
                          ? 'Sub cause'
                          : _currentSubCaseValue,
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
                                                // isShowLocation2 = true;
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
                    minWidth: 0,
                    child: Text(
                      _currentActionValue.isEmpty
                          ? 'Action'
                          : _currentActionValue,
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
                                              groupValue: _currentActionValue,
                                              onChanged: (val) {
                                                setState(() {
                                                  debugPrint('VAL = $val');
                                                  _currentActionValue =
                                                      val.toString();
                                                });
                                                Navigator.of(context).pop();
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
                      minWidth: 0,
                      child: Text(
                        _currentFaulttypeValue.isEmpty
                            ? 'Fault type'
                            : _currentFaulttypeValue,
                        style: TextStyle(color: Colors.white, fontSize: 12),
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
                                                    _currentFaulttypeValue,
                                                onChanged: (val) {
                                                  setState(() {
                                                    debugPrint('VAL = $val');
                                                    _currentFaulttypeValue =
                                                        val.toString();
                                                  });
                                                  Navigator.of(context).pop();
                                                  // isShowLocation2 = true;
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
            ),
            checkBox3
                ? Text(_currentSubCaseValue +
                    ' => ' +
                    _currentActionValue +
                    ' => ' +
                    _currentFaulttypeValue +
                    ' => ' +
                    'Clear')
                : Text(_currentSubCaseValue +
                    ' => ' +
                    _currentActionValue +
                    ' => ' +
                    _currentFaulttypeValue +
                    ' => ' +
                    'Not Clear'),

            RowWidget(),
            // ignore: dead_code
            checkBox2 ? SizedBox1() : Text(""),
            SizedBox(
              height: 10,
            ),
            // ignore: deprecated_member_use
            FlatButton(
              child: Text(
                'ส่งรายงาน',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () {
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text(''),
                    content: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 70),
                      child: const Text(
                        'ยืนยันสำเร็จ',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                           Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Report()));
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
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
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              height: 0.5,
              color: Colors.black,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(7.0),
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
                    decoration: InputDecoration(
                      labelText: "",
                      // hintText: 'AP',floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
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
              // ignore: deprecated_member_use
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
                    decoration: InputDecoration(labelText: "Serial Out:"),
                    onChanged: (newText) {},
                  ),
                ),
              ),
              // ignore: deprecated_member_use
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
