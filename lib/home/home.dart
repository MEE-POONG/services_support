import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:services_support/menu_page/check_name.dart';
import 'package:services_support/menu_page/profile.dart';
import 'package:services_support/menu_page/report.dart';
import 'package:services_support/menu_page/work.dart';
import 'package:services_support/menu_page/working.dart';

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

int _page = 0;
GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

List<Widget> _pageWidget = <Widget>[
  Profile(),
  CheckName(),
  Work(),
  Working(),
  Report(),
];

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightGreen,
      child: SafeArea(
        top: false,
        child: ClipRect(
          child: Scaffold(
            extendBody: true,
            bottomNavigationBar: CurvedNavigationBar(
              key: _bottomNavigationKey,
              index: 0,
              height: 60.0,
              items: <Widget>[
                Icon(Icons.home, size: 30),
                Icon(Icons.people, size: 30),
                Icon(Icons.notifications_active, size: 30),
                Icon(Icons.engineering, size: 30),
                Icon(Icons.poll_outlined, size: 30),
              ],
              color: Colors.lightGreen,
              buttonBackgroundColor: Colors.lightGreen[200],
              backgroundColor: Colors.transparent,
              animationCurve: Curves.easeInOut,
              animationDuration: Duration(milliseconds: 400),
              onTap: (index) {
                setState(() {
                  _page = index;
                });
              },
              letIndexChange: (index) => true,
            ),
             body: _pageWidget.elementAt(_page),
          ),
        ),
      ),
    );
  }
}
