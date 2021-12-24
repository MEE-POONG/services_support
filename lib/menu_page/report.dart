import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:services_support/home/bottomnavbar.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';

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
  TextEditingController reportController = TextEditingController();

  String? _report = 'Job Report: \n';
  @override
  void initState() {
    super.initState();
    // getNameCollection();
    getWorksheetCollection();
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

    print(_report);
    setState(() {
      reportController.text = _report.toString();
    });
  }

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
                    onPressed: () {},
                  ),
                  // ignore: deprecated_member_use
                  RaisedButton(
                    child: Text("ส่งรายงาน"),
                    onPressed: () {
                      Clipboard.setData(
                          ClipboardData(text: reportController.text));
                    },
                  ),
                ],
              ),
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
                  maxLines: 20,
                  // controller: Data2,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
