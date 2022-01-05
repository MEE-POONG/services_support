import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:localstorage/localstorage.dart';
import 'package:services_support/menu_page/report/report.dart';
import 'package:intl/intl.dart';

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
  TextEditingController wortsheetController = TextEditingController();
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
  bool checkWidget = false;
  String _input = "";
  String _input0 = "";
  String _input1 = "";
  String _input2 = "";
  String _input3 = "";
  String _input4 = "";
  String _input5 = "";

  String? _report = 'Job Report: \n';
  final _fireStore = FirebaseFirestore.instance;
  String worksheetId = '';
  TextEditingController reportController = TextEditingController();
  final LocalStorage storage = new LocalStorage('mee_report_app');

  @override
  void initState() {
    super.initState();
    _nameStream1 = FirebaseFirestore.instance
        .collection('name')
        .where('updateBy', whereIn: [_currentUserId]).snapshots();
  }

  Future<List<dynamic>?> getNameCollection(dynamic id) async {
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _fireStore
        .collection('name')
        .where('updateBy', whereIn: [_currentUserId]).get();
    int index = 0;
    setState(() {
      _report =
          _report.toString() + '-------------------------\n' + 'รายชื่อทีมงาน';
    });
    // Get data from docs and convert map to List
    querySnapshot.docs.map((doc) {
      index += 1;
      setState(() {
        _report = _report.toString() +
            '\n' +
            index.toString() +
            '. ' +
            doc.get('name') +
            ' Tel. ' +
            doc.get('phone');
      });
      return doc.data();
    }).toList();

    setState(() {
      _report = _report.toString() + '\n-------------------------';
    });
    getWorksheetStatusCollection(id);
  }

  Future<List<dynamic>?> getWorksheetCollection(dynamic id) async {
    // Get docs from collection reference
    DocumentSnapshot<Map<String, dynamic>> querySnapshot =
        await _fireStore.collection('worksheet').doc(id).get();
    // Get data from docs and convert map to List
    final updateAt = querySnapshot.get('updateAt');
    String formattedDate =
        DateFormat('dd-MM-yyyy').format(updateAt.toDate()).toString();
    String formattedTime =
        DateFormat('HH:mm:ss').format(updateAt.toDate()).toString();

    setState(() {
      worksheetId = querySnapshot.id;
      print(worksheetId);
    });

    setState(() {
      _report = _report.toString() + 'Date: ' + formattedDate + '\n';
    });
    setState(() {
      _report = _report.toString() + 'Time: ' + formattedTime + '\n';
    });

    setState(() {
      _report = _report.toString() + '-------------------------\n';
    });
    QuerySnapshot querySnapshot1 = await _fireStore
        .collection('user')
        .where('uid', whereIn: [_currentUserId]).get();
    final Team =
        querySnapshot1.docs[querySnapshot1.docs.length - 1].get('Team');
    setState(() {
      _report = _report.toString() + 'Team: ' + Team + '\n';
    });
    final Location =
        querySnapshot1.docs[querySnapshot1.docs.length - 1].get('Location');
    setState(() {
      _report = _report.toString() + 'พื้นที่รับผิดชอบ: ' + Location + '\n';
    });
    getNameCollection(id);
  }

  Future<List<dynamic>?> getWorksheetStatusCollection(dynamic id) async {
    // Get docs from collection reference
    DocumentSnapshot<Map<String, dynamic>> querySnapshot =
        await _fireStore.collection('worksheet').doc(id).get();
    // Get data from docs and convert map to List
    final Ststus = querySnapshot.get('Ststus');

    setState(() {
      _report = _report.toString() + '\nStstus: ' + Ststus + '\n';
    });

    setState(() {
      _report = _report.toString() + '-------------------------';
    });

    final Critical = querySnapshot.get('Critical');
    final Major = querySnapshot.get('Major');
    final Minor = querySnapshot.get('Minor');
    final None = querySnapshot.get('None');

    setState(() {
      _report = _report.toString() + '\nจำนวนใบงานใน TTSM\n';
    });

    setState(() {
      _report = _report.toString() + 'Critical = $Critical\n';
    });

    setState(() {
      _report = _report.toString() + 'Major = $Major\n';
    });

    setState(() {
      _report = _report.toString() + 'Minor = $Minor\n';
    });

    setState(() {
      _report = _report.toString() + 'None = $None\n';
    });

    // print(_report);
    setState(() {
      reportController.text = _report.toString();
    });
  }

  Future<void> addInputWork(
    type,
    data,
  ) async {
    setState(() {
      nameController.text = '';
    });
    return addWorks.add(
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
    ).then((value) {
      getWorksheetCollection(value.id);
      storage.setItem('WorkID', value.id);
    }).catchError((error) => print("Failed to add CM: $error"));
  }

  Future<void> addInputName(
    type,
    data,
  ) async {
    setState(() {
      nameController.text = '';
      phoneController.text = '';
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
                height: 40,
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
                height: 220,
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
                height: 40,
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
                                              setState(() {
                                                checkWidget = true;
                                              });

                                              Navigator.pop(context);
                                              // Navigator.pushAndRemoveUntil(
                                              //   context,
                                              //   MaterialPageRoute(
                                              //       builder: (context) =>
                                              //           Report()),
                                              //   (Route<dynamic> route) => false,
                                              // );
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
              RowWidget(),
              if (checkWidget)
                Container(
                    child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: TextField(
                        controller: reportController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        maxLines: 8,
                        // controller: Data2,
                      ),
                    ),
                    RaisedButton(
                      child: Text("Copy "),
                      onPressed: () {
                        Clipboard.setData(
                            ClipboardData(text: reportController.text));
                      },
                    ),
                  ],
                )),
              SizedBox(height: 250),
            ],
          ),
        ),
      ),
    );
  }
}

Widget RowWidget() {
  return Column();
}
