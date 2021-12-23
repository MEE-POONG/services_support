// import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:services_support/home/bottomnavbar.dart';
import 'package:services_support/menu_page/profile/profile.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:services_support/menu_page/working/working.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}

/////////////////////////////////////////////////////////////////
class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  //final FirebaseAuth _auth = FirebaseAuth.instance;
  final Stream<QuerySnapshot> _worksStream =
      FirebaseFirestore.instance.collection('work').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Mee Report",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Profile()));
          },
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
        elevation: 5,
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
                  "เลือกไซท์เพื่อเริ่มดำเนินการ ",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ],
            ),
          ),
          Container(
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

                    return TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Working()));
                      },
                      child: ListTile(
                        tileColor: Colors.blue[200],
                        title: Text(data['JobId'],
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
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
        i: 1,
      ),
    );
  }
}
