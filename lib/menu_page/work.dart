import 'package:flutter/material.dart';

// Import the firebase_core and cloud_firestore plugin
import 'package:cloud_firestore/cloud_firestore.dart';

class Work extends StatelessWidget {
  const Work({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}

////////////////////////////////////////////////////////////
class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

// ignore: non_constant_identifier_names
TextEditingController Data1 = TextEditingController();
// ignore: non_constant_identifier_names
TextEditingController Data2 = TextEditingController();
// ignore: non_constant_identifier_names
TextEditingController Data3 = TextEditingController();
// ignore: non_constant_identifier_names
TextEditingController Data4 = TextEditingController();

String _inputCm = "";
String _input2 = "";
String _input3 = "";
String _input4 = "";

class _BodyState extends State<Body> {
  // Create a CollectionReference called users that references the firestore collection
  CollectionReference addWork = FirebaseFirestore.instance.collection('work');

  Future<void> addInputWork(
    type,
    data,
  ) {
    // Call the user's CollectionReference to add a new user
    String subStr = data;
    String str = subStr;
    List _listData = str.split(":");

    setState(() {
      Data1.text = 'JobId: ' +
          _listData[0].toString() +
          '\n' +
          'Alarm: ' +
          _listData[1].toString() +
          '\n' +
          'Site: ' +
          _listData[2].toString().split("-")[0] +
          '\n' +
          'LocationFault: ' +
          _listData[2].toString().split("-")[1].split(" ")[0] +
          '\n' +
          'Priority: ' +
          _listData[6].toString() +
          '\n' +
          'FinshTime: ' +
          _listData[7].replaceAll("Finish Before ", "").toString() +
          '\n' +
          'AssignTo: ' +
          str.substring(str.indexOf("to") + 3, str.indexOf("by")) +
          '\n' +
          'AssignBy: ' +
          str.substring(str.indexOf("by") + 3);
    });
    return addWork
        .add({
          'JobId': _listData[0].toString(),
          'Alarm': _listData[1].toString(),
          'Site': _listData[2].toString().split("-")[0],
          'LocationFault': _listData[2].toString().split("-")[1].split(" ")[0],
          'Priority': _listData[6].toString(),
          'FinshTime': _listData[7].replaceAll("Finish Before ", "").toString(),
          'AssignTo': str.substring(str.indexOf("to") + 3, str.indexOf("by")),
          'AssignBy': str.substring(str.indexOf("by") + 3),
          'createAt': DateTime.now(),
          'createBy': 'ADMIN',
          'updateAt': DateTime.now(),
          'updateBy': 'ADMIN',
        })
        .then((value) => print("CM Added $value"))
        .catchError((error) => print("Failed to add CM: $error"));
  }

  clearData() {
    setState(() {
      _inputCm = "";
      _input2 = "";
      _input3 = "";
      _input4 = "";
      Data1.clear();
      Data2.clear();
      Data3.clear();
      Data4.clear();
    });
    print("CLEAR");
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "เลือกประเภทงานที่ได้รับ",
            style: TextStyle(color: Colors.white),
          ),
          // centerTitle: true,
          // leading: IconButton(
          //   icon: Icon(Icons.arrow_back_ios_outlined),
          //   onPressed: () {},
          // ),
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
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: Colors.white,
            indicatorWeight: 2.5,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black,
            tabs: <Tab>[
              Tab(text: "CM"),
              Tab(text: "CM Manual"),
              Tab(text: "PM"),
              Tab(text: "Activity"),
            ],
          ),
          elevation: 10,
          titleSpacing: 20,
        ),
        body: Container(
          child: TabBarView(
            children: <Widget>[
              Scaffold(
                body: Container(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      Text("รายละเอียดงาน", style: TextStyle(fontSize: 15)),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "วางข้อความที่ได้รับจากSMS",
                          ),
                          maxLines: 10,
                          controller: Data1,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // ignore: deprecated_member_use
                          RaisedButton(
                            child: Text("Update"),
                            onPressed: () async {
                              setState(() {
                                _inputCm = Data1.text;
                              });
                              await addInputWork("CM", Data1.text);
                            },
                          ),
                          // ignore: deprecated_member_use
                          RaisedButton(
                            child: Text("ล้างข้อมูล"),
                            onPressed: () {
                              clearData();
                            },
                          ),
                        ],
                      ),
                      Text(Data1.text)
                    ],
                  ),
                ),
              ),
              Scaffold(
                body: Container(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      Text("รายละเอียดงาน", style: TextStyle(fontSize: 15)),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "วางข้อความที่ได้รับจากSMS",
                          ),
                          maxLines: 10,
                          controller: Data2,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // ignore: deprecated_member_use
                          RaisedButton(
                            child: Text("Update"),
                            onPressed: () async {
                              setState(() {
                                _input2 = Data2.text;
                              });
                              await addInputWork("CM MANUAL", Data2.text);
                            },
                          ),
                          // ignore: deprecated_member_use
                          RaisedButton(
                            child: Text("ล้างข้อมูล"),
                            onPressed: () {
                              clearData();
                            },
                          ),
                        ],
                      ),
                      Text("$_input2")
                    ],
                  ),
                ),
              ),
              Scaffold(
                body: Container(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      Text("รายละเอียดงาน", style: TextStyle(fontSize: 15)),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "วางข้อความที่ได้รับจากSMS",
                          ),
                          maxLines: 10,
                          controller: Data3,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // ignore: deprecated_member_use
                          RaisedButton(
                            child: Text("Update"),
                            onPressed: () {
                              setState(() {
                                _input3 = Data3.text;
                              });
                            },
                          ),
                          // ignore: deprecated_member_use
                          RaisedButton(
                            child: Text("ล้างข้อมูล"),
                            onPressed: () {
                              clearData();
                            },
                          ),
                        ],
                      ),
                      Text("$_input3")
                    ],
                  ),
                ),
              ),
              Scaffold(
                body: Container(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      Text("รายละเอียดงาน", style: TextStyle(fontSize: 15)),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "วางข้อความที่ได้รับจากSMS",
                          ),
                          maxLines: 10,
                          controller: Data4,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // ignore: deprecated_member_use
                          RaisedButton(
                            child: Text("Update"),
                            onPressed: () {
                              setState(() {
                                _input4 = Data4.text;
                              });
                            },
                          ),
                          // ignore: deprecated_member_use
                          RaisedButton(
                            child: Text("ล้างข้อมูล"),
                            onPressed: () {
                              clearData();
                            },
                          ),
                        ],
                      ),
                      Text("$_input4")
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
