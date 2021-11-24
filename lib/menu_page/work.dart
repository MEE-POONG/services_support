import 'package:flutter/material.dart';

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

String _input1 = "";
String _input2 = "";
String _input3 = "";
String _input4 = "";

class _BodyState extends State<Body> {
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
            isScrollable: false,
            indicatorColor: Colors.white,
            indicatorWeight: 2.5,
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
                      Text("รายละเอียดงาน", style: TextStyle(fontSize: 20)),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "วางข้อความที่ได้รับจากTTSM",
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
                            onPressed: () {
                              setState(() {
                                _input1 = Data1.text;
                              });
                            },
                          ),
                          // ignore: deprecated_member_use
                          RaisedButton(
                            child: Text("ล้างข้อมูล"),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      Text("$_input1")
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
                      Text("รายละเอียดงาน", style: TextStyle(fontSize: 20)),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "วางข้อความที่ได้รับจากTTSM",
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
                            onPressed: () {
                              setState(() {
                                _input2 = Data2.text;
                              });
                            },
                          ),
                          // ignore: deprecated_member_use
                          RaisedButton(
                            child: Text("ล้างข้อมูล"),
                            onPressed: () {},
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
                      Text("รายละเอียดงาน", style: TextStyle(fontSize: 20)),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "วางข้อความที่ได้รับจากTTSM",
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
                            onPressed: () {},
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
                      Text("รายละเอียดงาน", style: TextStyle(fontSize: 20)),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "วางข้อความที่ได้รับจากTTSM",
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
                            onPressed: () {},
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
