import 'package:flutter/material.dart';
import 'package:services_support/home/home.dart';

class Working extends StatelessWidget {
  const Working({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     "เลือกไซต์เพื่อดำเนินการ",
      //     style: TextStyle(color: Colors.white),
      //   ),
      //   centerTitle: true,
      //   leading: IconButton(
      //     icon: Icon(Icons.arrow_back_ios),
      //     onPressed: () {
      //       Navigator.of(context)
      //           .push(MaterialPageRoute(builder: (context) => Home()));
      //     },
      //   ),
      //   actions: [
      //     IconButton(
      //       icon: Icon(
      //         Icons.search,
      //         size: 30,
      //       ),
      //       onPressed: () {},
      //     ),
      //   ],
      //   flexibleSpace: Container(
      //     decoration: BoxDecoration(
      //       gradient: LinearGradient(
      //         colors: [Colors.deepPurple, Colors.lightBlue],
      //       ),
      //     ),
      //   ),
      //   elevation: 5,
      // ),
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
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [],
                      ),
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
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [],
                      ),
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
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [],
                      ),
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
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    // return Column(
    //   children: [
    //     Container(
    //       decoration: BoxDecoration(
    //         gradient: LinearGradient(
    //           colors: [Colors.deepPurple, Colors.lightBlue],
    //         ),
    //       ),
    //       height: 50,
    //       child: Padding(
    //         padding: const EdgeInsets.all(10),
    //         child: Row(
    //           children: [
    //             Text(
    //               "รายละเอียดไซต์ :",
    //               style: TextStyle(
    //                   color: Colors.white,
    //                   fontSize: 15,
    //                   fontWeight: FontWeight.bold),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //     Container(
    //       child: Column(
    //         children: <Widget>[
    //           SizedBox(
    //             height: 10,
    //           ),
    //           TextField(
    //             maxLines: 3,
    //           ),
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: [
    //               // ignore: deprecated_member_use
    //               RaisedButton(
    //                 color: Colors.lightBlue,
    //                 child: Text("Depart"),
    //                 onPressed: () {},
    //               ),
    //               // ignore: deprecated_member_use
    //               RaisedButton(
    //                 color: Colors.lightBlue,
    //                 child: Text("Onsite"),
    //                 onPressed: () {},
    //               ),
    //               // ignore: deprecated_member_use
    //               RaisedButton(
    //                 color: Colors.lightBlue,
    //                 child: Text("Done"),
    //                 onPressed: () {},
    //               ),
    //               // ignore: deprecated_member_use
    //               RaisedButton(
    //                 color: Colors.lightBlue,
    //                 child: Text("Get location"),
    //                 onPressed: () {},
    //               ),
    //             ],
    //           ),
    //         ],
    //       ),
    //     ),
    //   ],
    // );
  }
}
