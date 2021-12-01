import 'package:flutter/material.dart';
import 'package:services_support/check_name/tab1.dart';
import 'package:services_support/check_name/tab2.dart';

class CheckName extends StatelessWidget {
  const CheckName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}

////////////////////////////////////////////////////////////////
class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Check Name",
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
          bottom: TabBar(
            isScrollable: false,
            indicatorColor: Colors.white,
            indicatorWeight: 2.5,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black,
            tabs: <Tab>[
              Tab(text: "แจ้งรายชื่อผู้ปฏิบัติงาน"),
              Tab(text: "ใบงานทั้งหมดในTTSM"),
            ],
          ),
          elevation: 10,
          titleSpacing: 20,
        ),
        body: Container(
          child: TabBarView(
            children: <Widget>[
              Tab1(),
              Tab2(),
            ],
          ),
        ),
      ),
    );
  }
}
