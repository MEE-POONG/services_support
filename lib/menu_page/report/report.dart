import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:services_support/home/bottomnavbar.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';
import 'package:services_support/menu_page/report/all_report.dart';

class Report extends StatelessWidget {
  const Report({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Report",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              size: 30,
            ),
            onPressed: () {},
          ),
        ],
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple, Colors.lightBlue],
            ),
          ),
        ),
        elevation: 4,
      ),
      body: SingleChildScrollView(child: Body()),
      bottomNavigationBar: BottomNavBarFb5(
        i: 5,
      ),
    );
  }
}

///////////////////////////////////////////////////////////
class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String? _currentUserId = FirebaseAuth.instance.currentUser?.uid;
  TextEditingController wortsheetController = TextEditingController();
  TextEditingController reportController = TextEditingController();

  String? _report = 'Job Report: \n';
  String? _reportWork = 'Job Report: \n';

  final LocalStorage storage = new LocalStorage('mee_report_app');
  String JobId = '';
  String JobKey = '';
  String worksheetId = '';

  @override
  void initState() {
    super.initState();
    // getNameCollection();
    JobId = storage.getItem('JobId');
    JobKey = storage.getItem('JobKey');

    getWorksheetCollection();
    getWorkCollection();
  }

  final _fireStore = FirebaseFirestore.instance;

  Future<List<dynamic>?> getNameCollection() async {
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
    getWorksheetStatusCollection();
  }

  Future<List<dynamic>?> getWorksheetCollection() async {
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _fireStore
        .collection('worksheet')
        .where('updateBy', whereIn: [_currentUserId]).get();
    // Get data from docs and convert map to List
    final updateAt =
        querySnapshot.docs[querySnapshot.docs.length - 1].get('updateAt');
    String formattedDate =
        DateFormat('dd-MM-yyyy').format(updateAt.toDate()).toString();
    String formattedTime =
        DateFormat('HH:mm:ss').format(updateAt.toDate()).toString();

    setState(() {
      worksheetId = querySnapshot.docs[querySnapshot.docs.length - 1].id;
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
    getNameCollection();
  }

  Future<List<dynamic>?> getWorksheetStatusCollection() async {
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _fireStore
        .collection('worksheet')
        .where('updateBy', whereIn: [_currentUserId]).get();
    // Get data from docs and convert map to List
    final Ststus =
        querySnapshot.docs[querySnapshot.docs.length - 1].get('Ststus');

    setState(() {
      _report = _report.toString() + '\nStstus: ' + Ststus + '\n';
    });

    setState(() {
      _report = _report.toString() + '-------------------------';
    });

    final Critical =
        querySnapshot.docs[querySnapshot.docs.length - 1].get('Critical');
    final Major =
        querySnapshot.docs[querySnapshot.docs.length - 1].get('Major');
    final Minor =
        querySnapshot.docs[querySnapshot.docs.length - 1].get('Minor');
    final None = querySnapshot.docs[querySnapshot.docs.length - 1].get('None');

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

  Future<List<dynamic>?> getWorkCollection() async {
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _fireStore
        .collection('work')
        .where('JobId', whereIn: [JobId]).get();
    // print(querySnapshot.docs[0].get('JobId'));

    final LeaveAt = querySnapshot.docs[0].get('LeaveAt');
    String formattedDate =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(LeaveAt.toDate()).toString();

    setState(() {
      _reportWork = _reportWork.toString() + 'ใบงานที่: 1\n';
    });
    setState(() {
      _reportWork = _reportWork.toString() + 'Date: $formattedDate\n';
    });

    QuerySnapshot querySnapshot1 = await _fireStore
        .collection('user')
        .where('uid', whereIn: [_currentUserId]).get();
    final Team =
        querySnapshot1.docs[querySnapshot1.docs.length - 1].get('Team');
    setState(() {
      _reportWork = _reportWork.toString() + 'Team: ' + Team;
    });

    QuerySnapshot querySnapshot2 = await _fireStore
        .collection('name')
        .where('updateBy', whereIn: [_currentUserId]).get();
    int index = 0;
    querySnapshot2.docs.map((doc) {
      index += 1;
      setState(() {
        _reportWork = _reportWork.toString() +
            '\n' +
            'ชื่อ: ' +
            doc.get('name') +
            '\nเบอร์โทร: ' +
            doc.get('phone');
      });
      return doc.data();
    }).toList();

    setState(() {
      _reportWork = _reportWork.toString() + '\n-------------------------';
    });

    final createAt = querySnapshot.docs[0].get('createAt');
    String formattedcreateAt =
        DateFormat('HH:mm:ss').format(createAt.toDate()).toString();
    setState(() {
      _reportWork = _reportWork.toString() + '\n Assign: $formattedcreateAt';
    });

    final Depart = querySnapshot.docs[0].get('Depart');
    String formattedDepart =
        DateFormat('HH:mm:ss').format(Depart.toDate()).toString();
    setState(() {
      _reportWork = _reportWork.toString() + '\n Depart: $formattedDepart';
    });

    final OnSite = querySnapshot.docs[0].get('OnSite');
    String formattedOnSite =
        DateFormat('HH:mm:ss').format(OnSite.toDate()).toString();
    setState(() {
      _reportWork = _reportWork.toString() + '\n On-Site: $formattedOnSite';
    });

    final AlarmClear = querySnapshot.docs[0].get('AlarmClear');
    String formattedAlarmClear =
        DateFormat('HH:mm:ss').format(AlarmClear.toDate()).toString();
    setState(() {
      _reportWork =
          _reportWork.toString() + '\n Alarm Clear: $formattedAlarmClear';
    });

    String formattedLeaveAt =
        DateFormat('HH:mm:ss').format(LeaveAt.toDate()).toString();
    setState(() {
      _reportWork = _reportWork.toString() + '\n Leave: $formattedLeaveAt';
    });

    setState(() {
      _reportWork = _reportWork.toString() + '\n-------------------------';
    });

    final Defact = querySnapshot.docs[0].get('Defact');
    setState(() {
      _reportWork = _reportWork.toString() + '\n อาการเสีย: $Defact';
    });

    final Sector = querySnapshot.docs[0].get('Sector');
    setState(() {
      _reportWork = _reportWork.toString() + '\n Setor: $Sector';
    });

    final Check0 = querySnapshot.docs[0].get('Check0');
    setState(() {
      _reportWork = _reportWork.toString() + '\n 1.ที่สูง: $Check0';
    });

    final Check1 = querySnapshot.docs[0].get('Check1');
    setState(() {
      _reportWork = _reportWork.toString() + '\n 2.เทปพันสาย: $Check1';
    });

    final Check2 = querySnapshot.docs[0].get('Check2');
    setState(() {
      _reportWork = _reportWork.toString() + '\n 3.สแปร์ที่ใช้: $Check2';
    });

    final Check3 = querySnapshot.docs[0].get('Check3');
    setState(() {
      _reportWork = _reportWork.toString() + '\n 4.ปั่นไฟ: $Check3';
    });

    final Correction = querySnapshot.docs[0].get('Correction');
    setState(() {
      _reportWork =
          _reportWork.toString() + '\n 5.รายละเอียดการแก้ไข: $Correction';
    });

    final Check4 = querySnapshot.docs[0].get('Check4');
    setState(() {
      _reportWork =
          _reportWork.toString() + '\n 6.Defect จากงานที่ติดตั้ง: $Check4';
    });

    final Check5 = querySnapshot.docs[0].get('Check5');
    setState(() {
      _reportWork = _reportWork.toString() + '\n 7.ใช้กุญแจ: $Check5';
    });

    final Check6 = querySnapshot.docs[0].get('Check6');
    setState(() {
      _reportWork = _reportWork.toString() + '\n 8.Alarm Status: $Check6';
    });

    if (Check2 != 'No') {
      final SerialIn = querySnapshot.docs[0].get('SerialIn');
      setState(() {
        _reportWork = _reportWork.toString() + '\n\n Equip-In: $SerialIn';
      });

      final SerialOut = querySnapshot.docs[0].get('SerialOut');
      setState(() {
        _reportWork = _reportWork.toString() + '\n Equip-Out: $SerialOut';
      });
    }
    final JobDetail = querySnapshot.docs[0].get('JobDetail');

    setState(() {
      _reportWork = _reportWork.toString() + '\n Job detail:\n$JobDetail';
    });

    wortsheetController.text = _reportWork.toString();
    // print(_reportWork);
  }

  TextEditingController textFieldController = TextEditingController();
  TextEditingController criticalController = TextEditingController(text: '0');
  TextEditingController minorController = TextEditingController(text: '0');
  TextEditingController majorController = TextEditingController(text: '0');
  TextEditingController noneController = TextEditingController(text: '0');
  bool checkWidget = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple, Colors.lightBlue],
            ),
          ),
          height: 50,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Today Report all job",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        Container(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // ignore: deprecated_member_use
                  OutlinedButton(
                    child: Text("โหลดตัวอย่างรายงาน"),
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => AllReport()));
                    },
                  ),
                  // ignore: deprecated_member_use
                  RaisedButton(
                    child: Text("ส่งรายงาน"),
                    onPressed: () {
                      setState(() {
                        checkWidget = true;
                      });
                    },
                  ),
                ],
              ),
              RowWidget(),
              if (checkWidget)
                Container(
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Divider(height: 20, thickness: 2),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 7),
                          child: Text(
                              "คุณมีจำนวน 0 ใบงานที่ต้องชี้แจงเหตุผลที่ไม่สามารถปิดงานได้",
                              style: TextStyle(
                                  fontSize: 14, color: Colors.redAccent)),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              child: SizedBox(
                                width: 250,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      hintText: "สาเหตุที่เข้าปิดงานไม่ได้"),
                                  validator: (value) {},
                                  controller: textFieldController,
                                ),
                              ),
                            ),
                            // ignore: deprecated_member_use
                            FlatButton(
                              child: Text(
                                'บันทึก',
                                style: TextStyle(color: Colors.white),
                              ),
                              color: Colors.grey,
                              onPressed: () {},
                            )
                          ],
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 7),
                          child: Text(
                            "จำนวนใบงานค้างใน TTSM",
                            style: TextStyle(
                                fontSize: 18, color: Colors.blueAccent),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              child: SizedBox(
                                width: 60,
                                child: TextFormField(
                                  controller: criticalController,
                                  keyboardType: TextInputType.number,
                                  decoration:
                                      InputDecoration(labelText: "Critical:"),
                                  onChanged: (newText) {},
                                ),
                              ),
                            ),
                            Container(
                              child: SizedBox(
                                width: 50,
                                child: TextFormField(
                                  controller: majorController,
                                  keyboardType: TextInputType.number,
                                  decoration:
                                      InputDecoration(labelText: "Major"),
                                  onChanged: (newText) {},
                                ),
                              ),
                            ),
                            Container(
                              child: SizedBox(
                                width: 50,
                                child: TextFormField(
                                  controller: minorController,
                                  keyboardType: TextInputType.number,
                                  decoration:
                                      InputDecoration(labelText: "Minor"),
                                  onChanged: (newText) {},
                                ),
                              ),
                            ),
                            Container(
                              child: SizedBox(
                                width: 50,
                                child: TextFormField(
                                  controller: noneController,
                                  keyboardType: TextInputType.number,
                                  decoration:
                                      InputDecoration(labelText: "None"),
                                  onChanged: (newText) {},
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        // ignore: deprecated_member_use
                        FlatButton(
                          child: Text(
                            'ส่งและสร้างใบงาน',
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.grey,
                          onPressed: () async {
                            submit();
                          },
                        )
                      ],
                    ),
                  ),
                )
              else
                SizedBox(height: 30),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                child: Text("Copy Report "),
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: reportController.text));
                },
              ),
              SizedBox(height: 5),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: TextField(
                  controller: wortsheetController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 10,
                  // controller: Data2,
                ),
              ),
              RaisedButton(
                child: Text("Copy Report ใบงาน"),
                onPressed: () {
                  Clipboard.setData(
                      ClipboardData(text: wortsheetController.text));
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  void submit() {
    final data = {
      'TextEndJob': textFieldController.text,
      'CriticalEndJob': criticalController.text,
      'MajorEndJob': majorController.text,
      'MinorEndJob': minorController.text,
      'NoneEndJob': noneController.text,
      'updateAt': new DateTime.now(),
      'updateBy': _currentUserId
    };

    FirebaseFirestore.instance
        .collection('worksheet')
        .doc(worksheetId)
        .update(data)
        .then((value) => showDialogSuccess(context));
  }
}

Widget RowWidget() {
  return Column();
}

void showDialogSuccess(BuildContext context) {
  showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      // title: const Text('Onsite'),
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 80),
        child: const Text(
          'ยืนยันสำเร็จ',
          style: TextStyle(fontSize: 18),
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.pop(context, 'OK');
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => AllReport()));
          },
          child: const Text('OK'),
        ),
      ],
    ),
  );
}
