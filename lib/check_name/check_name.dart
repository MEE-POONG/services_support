import 'package:flutter/material.dart';
import 'package:services_support/check_name/tab1.dart';
import 'package:services_support/home/bottomnavbar.dart';

class CheckName extends StatelessWidget {
  const CheckName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Check Name",
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
  //String dropdownValue = 'Name';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Tab1(),
      bottomNavigationBar: BottomNavBarFb5(
        i: 2,
      ),
    );
  }
}
