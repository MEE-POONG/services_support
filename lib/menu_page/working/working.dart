import 'package:flutter/material.dart';
import 'package:services_support/home/home.dart';
import 'package:services_support/menu_page/working/depart.dart';
import 'package:services_support/menu_page/working/done.dart';
import 'package:services_support/menu_page/working/get_loc.dart';
import 'package:services_support/menu_page/working/onsite.dart';

class Working extends StatelessWidget {
  const Working({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Body(),
    );
  }
}

//////////////////////////////////////////////////////////
class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

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
            isScrollable: true,
            indicatorColor: Colors.white,
            indicatorWeight: 2.5,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black,
            tabs: <Tab>[
              Tab(text: "Depart"),
              Tab(text: "Onsite"),
              Tab(text: "Done"),
              Tab(text: "Get location"),
            ],
          ),
          elevation: 10,
          titleSpacing: 20,
        ),
        body: Container(
          child: TabBarView(
            children: <Widget>[
              Depart(),
              Onsite(),
              Done(),
              GetLocation(),
            ],
          ),
        ),
      ),
    );
  }
}
