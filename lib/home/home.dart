import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:services_support/home/bottomnavbar.dart';
import 'package:services_support/menu_page/profile.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Service Support",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
             Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Profile()));
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
      ),
      body: Container(),
      bottomNavigationBar: BottomNavBarFb5(),
    );
  }
}
