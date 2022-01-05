// import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:services_support/home/bottomnavbar.dart';
import 'package:services_support/menu_page/profile/profile.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:services_support/menu_page/working/working.dart';

import 'package:localstorage/localstorage.dart';

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
  String? _currentUserId = FirebaseAuth.instance.currentUser?.uid;
  Stream<QuerySnapshot> _worksStream = FirebaseFirestore.instance
      .collection('work')
      .where('updateBy', whereIn: ['']).snapshots();

  final LocalStorage storage = new LocalStorage('mee_report_app');

  _saveToStorage(key, data, Site) {
    storage.setItem('JobKey', key);
    storage.setItem('JobId', data);
    storage.setItem('Site', Site);
  }

  @override
  void initState() {
    super.initState();
    _worksStream = FirebaseFirestore.instance
        .collection('work')
        .where('updateBy', whereIn: [_currentUserId]).snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Mee Report",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.person,
              size: 30,
            ),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Profile()));
            },
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
            height: 40,
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
                        _saveToStorage(
                            document.id, data['JobId'], data['Site']);
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
        i: 1,
      ),
    );
  }
}
