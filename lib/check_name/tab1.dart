import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:services_support/menu_page/report/report.dart';

class Tab1 extends StatefulWidget {
  const Tab1({Key? key}) : super(key: key);

  @override
  _Tab1State createState() => _Tab1State();
}

class _Tab1State extends State<Tab1> {
//final FirebaseAuth _auth = FirebaseAuth.instance;
  String? _currentUserId = FirebaseAuth.instance.currentUser?.uid;

  Stream<QuerySnapshot> _nameStream1 = FirebaseFirestore.instance
      .collection('name')
      .where('updateBy', whereIn: ['']).snapshots();

  CollectionReference addWorks =
      FirebaseFirestore.instance.collection('worksheet');
  CollectionReference addName = FirebaseFirestore.instance.collection('name');
  final _formInputTTSMKey = GlobalKey<FormState>();
  final _formInputNameKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController criticalController = TextEditingController(text: '0');
  TextEditingController minorController = TextEditingController(text: '0');
  TextEditingController majorController = TextEditingController(text: '0');
  TextEditingController noneController = TextEditingController(text: '0');
  TextEditingController checkBoxController =
      TextEditingController(text: 'พร้อมรับงาน');
  bool isShowName = false;
  bool checkBox = false;
  String _input = "";
  String _input0 = "";
  String _input1 = "";
  String _input2 = "";
  String _input3 = "";
  String _input4 = "";
  String _input5 = "";

  @override
  void initState() {
    super.initState();
    _nameStream1 = FirebaseFirestore.instance
        .collection('name')
        .where('updateBy', whereIn: [_currentUserId]).snapshots();
  }

  Future<void> addInputWork(
    type,
    data,
  ) async {
    setState(() {
      nameController.text = '';
    });
    return addWorks
        .add(
          {
            'Critical': _input1,
            'Minor': _input2,
            'Major': _input3,
            'None': _input4,
            'Ststus': _input5,
            'createAt': DateTime.now(),
            'createBy': _currentUserId,
            'updateAt': DateTime.now(),
            'updateBy': _currentUserId
          },
        )
        .then((value) => print("Name $value"))
        .catchError((error) => print("Failed to add CM: $error"));
  }

  Future<void> addInputName(
    type,
    data,
  ) async {
    setState(() {
      nameController.text = '';
    });
    return addName
        .add(
          {
            'name': _input,
            'phone': _input0,
            'createAt': DateTime.now(),
            'createBy': _currentUserId,
            'updateAt': DateTime.now(),
            'updateBy': _currentUserId
          },
        )
        .then((value) => print("Name $value"))
        .catchError((error) => print("Failed to add CM: $error"));
  }

  @override
  Widget build(BuildContext context) {
    var time = DateTime.now();

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
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
                      "แจ้งรายชื่อผู้ปฏิบัติงานประจำวันที่ :  ${time.day}/${time.month.toString()}/${time.year}",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ],
                ),
              ),
              Container(
                height: 300,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Form(
                        key: _formInputNameKey,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: SizedBox(
                                width: 150,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      hintText: "เพิ่มรายชื่อผู้ปฏิบัติงาน"),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'กรุณากรอกชื่อ';
                                    }
                                    return null;
                                  },
                                  controller: nameController,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              child: SizedBox(
                                width: 100,
                                child: TextFormField(
                                  decoration:
                                      InputDecoration(hintText: "Numer Phone"),
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'กรุณากรอกเบอร์โทร';
                                    }
                                    return null;
                                  },
                                  controller: phoneController,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            ElevatedButton(
                                child: Text('Add',
                                    style: TextStyle(color: Colors.white)),
                                onPressed: () async {
                                  if (_formInputNameKey.currentState!
                                      .validate()) {
                                    setState(() {
                                      _input = nameController.text;
                                      _input0 = phoneController.text;
                                    });
                                    await addInputName(
                                        "Name", nameController.text);
                                  }
                                }),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        child: Container(
                          height: 300,
                          // color: Colors.blueAccent,
                          child: StreamBuilder<QuerySnapshot>(
                            stream: _nameStream1,
                            builder: (BuildContext context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              if (snapshot.hasError) {
                                return Text('Something went wrong');
                              }

                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Text("Loading");
                              }

                              return ListView(
                                children: snapshot.data!.docs
                                    .map((DocumentSnapshot document) {
                                  Map<String, dynamic> data =
                                      document.data()! as Map<String, dynamic>;
                                  // ignore: deprecated_member_use
                                  return OutlinedButton(
                                    onPressed: () {},
                                    child: ListTile(
                                      // tileColor: Colors.grey[300],
                                      title: Row(
                                        children: [
                                          Text(
                                            data['name'],
                                            style: TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                          Text(
                                            ' ' + data['phone'],
                                            style: TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }).toList(),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
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
                      "ใบงานทั้งหมดในTTSM",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ],
                ),
              ),
              Container(
                child: Form(
                  key: _formInputTTSMKey,
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
                                controller: criticalController,
                                keyboardType: TextInputType.numberWithOptions(),
                                textInputAction: TextInputAction.done,
                                decoration:
                                    InputDecoration(labelText: "Critical:"),
                                validator: (value) {},
                              ),
                            ),
                          ),
                          Container(
                            child: SizedBox(
                              width: 150,
                              child: TextFormField(
                                controller: minorController,
                                keyboardType: TextInputType.numberWithOptions(),
                                textInputAction: TextInputAction.done,
                                decoration:
                                    InputDecoration(labelText: "Minor:"),
                                validator: (value) {},
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
                                controller: majorController,
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.done,
                                decoration:
                                    InputDecoration(labelText: "Major:"),
                                validator: (value) {},
                              ),
                            ),
                          ),
                          Container(
                            child: SizedBox(
                              width: 150,
                              child: TextFormField(
                                controller: noneController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(labelText: "None:"),
                                validator: (value) {},
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
                  Checkbox(
                    value: checkBox,
                    onChanged: (bool? b) {
                      setState(() {
                        checkBox = b!;
                      });
                    },
                  ),
                  Text("พร้อมรับงาน"),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: checkBox
                        ? () async {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  AlertDialog dialog = AlertDialog(
                                      content: Text("ยืนยันสำเร็จ"),
                                      actions: [
                                        TextButton(
                                            child: Text('ตกลง',
                                                style: TextStyle(
                                                    color: Colors.blueAccent)),
                                            onPressed: () {
                                              Navigator.pop(context);
                                              Navigator.pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Report()),
                                                (Route<dynamic> route) => false,
                                              );
                                            })
                                      ]);
                                  return dialog;
                                });
                            setState(() {
                              _input1 = criticalController.text;
                              _input2 = minorController.text;
                              _input3 = majorController.text;
                              _input4 = noneController.text;
                              _input5 = checkBoxController.text;
                            });
                            await addInputWork("TTSM", nameController.text);
                            //  addTTSM();
                          }
                        : null,
                    child: Text(
                      'ยืนยัน',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 250),
            ],
          ),
        ),
      ),
    );
  }
}
