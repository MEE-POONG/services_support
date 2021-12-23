import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:services_support/home/bottomnavbar.dart';
import 'package:services_support/home/home.dart';
import 'package:services_support/menu_page/working/done/done.dart';

import 'package:localstorage/localstorage.dart';
import 'package:services_support/models/work.dart';

class Working extends StatefulWidget {
  // const Working({Key? key}) : super(key: key);
  @override
  _WorkingState createState() => _WorkingState();
}

class _WorkingState extends State<Working> {
  final Stream<QuerySnapshot> _worksStream =
      FirebaseFirestore.instance.collection('work').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Working",
          // "เลือกไซต์เพื่อเริ่มดำเนินการ",
          style: TextStyle(color: Colors.white),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple, Colors.lightBlue],
            ),
          ),
        ),
        elevation: 10,
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.deepPurple, Colors.lightBlue],
              ),
            ),
            height: 50,
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "เลือกไซท์เพื่อเริ่มดำเนินการ ",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ],
            ),
          ),
          Container(
            height: 250,
            child: StreamBuilder<QuerySnapshot>(
              stream: _worksStream,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Something went wrong');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("Loading");
                }

                return ListView(
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data =
                        document.data()! as Map<String, dynamic>;

                    return OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => BodyWorking()));
                      },
                      child: ListTile(
                        // tileColor: Colors.blue[200],
                        title: Text(data['JobId'],
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500)),
                        subtitle: Text(data['Site']),
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBarFb5(
        i: 4,
      ),
    );
  }
}

//////////////////////////////////////////////////////////
class BodyWorking extends StatefulWidget {
  const BodyWorking({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<BodyWorking> {
  bool isOnsite = false;
  bool isDone = false;

  final LocalStorage storage = new LocalStorage('mee_report_app');
  String item = '';
  String JobKey = '';

  @override
  initState() {
    super.initState();
    item = storage.getItem('JobId');
    JobKey = storage.getItem('JobKey');
    print(JobKey);
    if (item == '') {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => Home()),
        (Route<dynamic> route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Working",
          // "เลือกไซต์เพื่อเริ่มดำเนินการ",
          style: TextStyle(color: Colors.white),
        ),
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
        elevation: 10,
      ),
      body: Column(
        children: [
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
                  "รายละเอียดไซต์งาน : $item",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // ignore: deprecated_member_use
              FlatButton(
                child: Row(
                  children: [
                    Text('Depart', style: TextStyle(color: Colors.white)),
                  ],
                ),
                color: Colors.purple,
                onPressed: () {
                  // เพิ่มเวลา depart
                  updateDepart();
                  // show dialog และแสดงแผนที่
                  dialogSuccessAndShowMap(context);
                },
              ),
              // ignore: deprecated_member_use
              FlatButton(
                  child: Text('Onsite', style: TextStyle(color: Colors.white)),
                  color: Colors.orange,
                  onPressed: () {
                    updateOnsite();
                    showDialogSuccess(context);
                    setState(() {
                      isOnsite = true;
                    });
                  }),
              // ignore: deprecated_member_use
              FlatButton(
                  child: Text('Done', style: TextStyle(color: Colors.white)),
                  color: Colors.green,
                  onPressed: () {
                    updateAlarmClear();
                    setState(() {
                      isDone = true;
                    });
                  }),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          isDone == true
              ? SingleChildScrollView(
                  child: Container(
                    height: 620,
                    child: Done(),
                  ),
                )
              : Text(''),
        ],
      ),
    );
  }

  void updateAlarmClear() {
    FirebaseFirestore.instance
        .collection('work')
        .doc(JobKey)
        .update({'AlarmClear': new DateTime.now()});
  }

  void showDialogSuccess(BuildContext context) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Onsite'),
        content: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80),
          child: const Text(
            'ยืนยันสำเร็จ',
            style: TextStyle(fontSize: 18),
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void updateOnsite() {
    FirebaseFirestore.instance
        .collection('work')
        .doc(JobKey)
        .update({'OnSite': new DateTime.now()});
  }

  void dialogSuccessAndShowMap(BuildContext context) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Drpart'),
        content: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80),
          child: const Text(
            'ยืนยันสำเร็จ',
            style: TextStyle(fontSize: 18),
          ),
        ),
        actions: <Widget>[
          TextButton(
              child: const Text('OK'),
              onPressed: () {
                MapsLauncher.launchCoordinates(
                    14.9698804, 102.1020475, 'MEE POONG CO., LTD.');
                Navigator.pop(context, 'OK');
              }),
        ],
      ),
    );
  }

  void updateDepart() {
    FirebaseFirestore.instance
        .collection('work')
        .doc(JobKey)
        .update({'Depart': new DateTime.now()});
  }
}
