import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:localstorage/localstorage.dart';
import 'package:services_support/menu_page/report/report.dart';

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
  String? _currentUserId = FirebaseAuth.instance.currentUser?.uid;

  bool checkBox0 = false;
  bool checkBox1 = false;
  bool checkBox2 = false;
  bool checkBox3 = false;
  bool checkBox4 = false;
  bool checkBox5 = false;
  bool checkBox6 = false;

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
    'Effect From Customer Side-105',
    'Hub-103',
    'L2-102',
    'Optic ตอนนอกขาด-124',
    'RJ45-155'
  ];

  var items1_1 = ['Air-Condition_69', 'Filter_70', 'Module-68'];
  var items1_2 = [
    'AP-95',
    'Config-96',
    'Confirm Link&Service-97',
    'Effect from costomer side-100',
    'Surge-98',
    'UTP-99'
  ];
  var items1_3 = [
    'Adapter-73',
    'AP-72',
    'Config-74',
    'Confirm Link&Service-80',
    'Effect from customer side-81',
    'Optic ตอนนอกขาด-71',
    'Patch cord-75',
    'Router-76',
    'SFP-77',
    'Switch-78',
    'UTP-79'
  ];
  var items1_4 = [
    'Config-83',
    'Confirm Link&Service-84',
    'DSLAM Card Control-85',
    'DSLAM Card Power-86',
    'DSLAM Hang-88',
    'Effect from customer side-94',
    'GPON-89',
    'OLT Card Control-90',
    'OLT Card Power-91',
    'Optic ตอนนอกขาด-82',
    'PLC Splitter-92',
    'SFP-93'
  ];
  var items1_5 = ['PM SITE ล้าง Filter-110', 'Visual Check Tower-111'];
  var items1_6 = ['AC MAIN FAILED-67', 'ไฟฟ้า Clear-66'];
  var items1_7 = [
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
    'FOUC 9.8G/300M-160',
    'FPAA-136',
    'FS3-12',
    'FS3A-13',
    'FS5-14',
    'FS5A-15',
    'Patch cord-114',
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
  var items1_8 = [
    'AAU-151',
    'AHEGA-63',
    'AHEGB-64',
    'AHEGC-146',
    'Antenna-29',
    'AP-115',
    'Aoto Clear-145',
    'BPF-57',
    'CPRI LC-LC Dual 80 M FUFDD-52',
    'CPRI FC-LC 10M-113',
    'CPRI FC-LC 50M-143',
    'CPRI LC-FC 10M FUFAV-43',
    'CPRI LC-FC 100M FUFAU-47',
    'CPRI LC-FC 30M FUFAZ-44',
    'CPRI LC-FC 50M FUFAT-45',
    'CPRI LC-FC 70M FUFEJ-46',
    'CPRI LC-LC 10M FUFBC-48',
    'CPRI LC-LC 100M FUFAY-51',
    'CPRI LC-LC 100M-142',
    'CPRI LC-LC 30M FUFBA-49',
    'CPRI LC-LC 50M FUFBB-50',
    'CPRI LC-LC 60M-140',
    'CPRI LC-LC 80M-141',
    'CPRI LC-LC Armoured 60M-130',
    'DC Connector-30',
    'FC Adaptor(แกนI)-153',
    'FOSH 6G/300M SFP H-53',
    'FOSI 6G/15KM SFP I-54',
    'FOUA 9.8G/20KM-55',
    'FOUC 9.8G/300M-56',
    'FPAA-157',
    'FPAD-159',
    'FPAE-158',
    'FRGT-147',
    'FXDD-65',
    'GPS-122',
    'Jumper-33',
    'Microwave-150',
    'ODU-125',
    'OPDCD1-127',
    'PPC BOX-58',
    'R8862A S2100-60',
    'R8862A S9000-59',
    'R8881 AC-32',
    'R8881 DC-31',
    'R8882-61',
    'R8892E-62',
    'RET ACE-131',
    'RET AGISSON-148',
    'RET Cable-34',
    'RET COMBA-119',
    'RET FIBERHOME-120',
    'RET Goodtrl-149',
    'RET HW-118',
    'RET MOBI-35',
    'RET RCU-132',
    'SFP RRU 10G 10KM-40',
    'SFP RRU 10G 15KM-41',
    'SFP RRU 2.5G 15KM-36',
    'SFP RRU 2.5G 2KM-129',
    'SFP RRU 6G 1.4KM-37',
    'SFP RRU 6G 10KM-39',
    'SFP RRU 6G 15KM-134',
    'SFP RRU 6G 2KM-38',
    'Splitter-42',
    'ZTE830-121',
    'ปรับ Antenna-112'
  ];
  var items1_9 = ['CPRI-107', 'Hardware-109', 'Optic ตอนนอกขาด-106', 'SFP-108'];
  var items1_10 = [
    'AC Adaptor-154',
    'AP-101',
    'Core-104',
    'Effect From Customer Side-105',
    'Hub-103',
    'L2-102',
    'Optic ตอนนอกขาด-124',
    'RJ45-155'
  ];

  TextEditingController checkProblemCaseController =
      TextEditingController(text: ' =>  =>  => Not Clear');

  TextEditingController defactController = TextEditingController();
  TextEditingController sectorController = TextEditingController();
  TextEditingController correctionController = TextEditingController();
  TextEditingController remarkController = TextEditingController();

  TextEditingController apController = TextEditingController();
  TextEditingController gobbetController = TextEditingController();
  TextEditingController serialInController = TextEditingController();
  TextEditingController serialOutController = TextEditingController();
  var _formkey;

  final LocalStorage storage = new LocalStorage('mee_report_app');
  String JobKey = '';
  @override
  void initState() {
    super.initState();
    JobKey = storage.getItem('JobKey');
  }

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
                      controller: defactController,
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
                      controller: sectorController,
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
                controller: correctionController,
                decoration: InputDecoration(hintText: "ระบุการแก้ไข"),
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
                                                  _currentFaulttypeValue = '';
                                                  if (val == 'AIR') {
                                                    items3 = items1_1;
                                                  }
                                                  if (val == 'AIRNET') {
                                                    items3 = items1_2;
                                                  }
                                                  if (val == 'EDS') {
                                                    items3 = items1_3;
                                                  }
                                                  if (val == 'FBB') {
                                                    items3 = items1_4;
                                                  }
                                                  if (val == 'PM') {
                                                    items3 = items1_5;
                                                  }
                                                  if (val == 'Power') {
                                                    items3 = items1_6;
                                                  }
                                                  if (val == 'Radio') {
                                                    items3 = items1_7;
                                                  }
                                                  if (val ==
                                                      'Radio(Work on Tower)') {
                                                    items3 = items1_8;
                                                  }
                                                  if (val == 'Transmission') {
                                                    items3 = items1_9;
                                                  }
                                                  if (val == 'WIFI') {
                                                    items3 = items1_10;
                                                  }
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
                                                    //      checkSubCaseController.text =
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
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                  decoration: InputDecoration(
                      hintText: checkBox3
                          ? checkProblemCaseController.text =
                              _currentSubCaseValue +
                                  ' => ' +
                                  _currentActionValue +
                                  ' => ' +
                                  _currentFaulttypeValue +
                                  ' => ' +
                                  'Clear'
                          : checkProblemCaseController.text =
                              _currentSubCaseValue +
                                  ' => ' +
                                  _currentActionValue +
                                  ' => ' +
                                  _currentFaulttypeValue +
                                  ' => ' +
                                  'Not Clear'),
                  textAlign: TextAlign.center,
                  controller: checkProblemCaseController),
            ),
            RowWidget(),
            // ignore: dead_code
            checkBox2
                ? Container(
                    child: Form(
                      key: _formkey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 7),
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
                                    controller: apController,
                                    decoration: InputDecoration(
                                      hintText: "AP",
                                    ),
                                    onChanged: (newText) {},
                                  ),
                                ),
                              ),
                              Container(
                                child: SizedBox(
                                  width: 100,
                                  child: TextFormField(
                                    controller: gobbetController,
                                    keyboardType: TextInputType.number,
                                    decoration:
                                        InputDecoration(hintText: "จำนวน"),
                                    onChanged: (newText) {},
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                                "Equipment move in Serial No.(ของดี>เปลี่ยนเข้า)",
                                style: TextStyle(fontSize: 13)),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                child: SizedBox(
                                  width: 250,
                                  child: TextFormField(
                                    controller: serialInController,
                                    decoration: InputDecoration(
                                        labelText: "Serial In:"),
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
                            child: Text(
                                "Equipment move Out Serial No.(ของเสีย>เปลี่ยนออก)",
                                style: TextStyle(fontSize: 13)),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                child: SizedBox(
                                  width: 250,
                                  child: TextFormField(
                                    controller: serialOutController,
                                    decoration: InputDecoration(
                                        labelText: "Serial Out:"),
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
                  ) /*  */ : Text(""),
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
              onPressed:  () async {
                updateDone();

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
            SizedBox(height: 300),
          ],
        ),
      ),
    );
  }

  void updateDone() {
    final data = {
      'Defact': defactController.text,
      'Sector': sectorController.text,
      'Correction': correctionController.text.isEmpty
          ? '<>'
          : correctionController.text,
      'Check0': checkBox0 ? 'Yes' : 'No',
      'Check1': checkBox1 ? 'Yes' : 'No',
      'Check2': checkBox2 ? 'AP' : 'No',
      'Check3': checkBox3 ? 'Clear' : 'Not Clear',
      'Check4': checkBox4 ? 'Yes' : 'No',
      'Check5': checkBox5 ? 'Yes' : 'No',
      'Check6': checkBox6 ? 'Yes' : 'No',
      'Remark': remarkController.text,
      'SubCause': _currentSubCaseValue,
      'Action': _currentActionValue,
      'FaultType': _currentFaulttypeValue,
      'ProblemCase': checkProblemCaseController.text,
      'AP': apController.text,
      'APLenght': gobbetController.text,
      'SerialIn': serialInController.text,
      'SerialOut': serialOutController.text,
      'LeaveAt': new DateTime.now(),
      'updateAt': new DateTime.now(),
      'updateBy': _currentUserId
    };
    FirebaseFirestore.instance
        .collection('work')
        .doc(JobKey)
        .update(data);
  }
}

Widget RowWidget() {
  return Row();
}
