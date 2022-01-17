import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:services_support/home/home.dart';
import 'package:services_support/login/login.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class SplashSrceen extends StatelessWidget {
  const SplashSrceen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/พื้นหลัง App.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Body(),
      ),
    );
  }
}

///////////////////////////////////////////////////////////////////////////
class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Welcome",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Text(
                "ยินดีต้อนรับสู่แอพที่รวดเร็วและดีที่สุด",
                style: TextStyle(color: Colors.black),
              ),
              Image.asset(
                "assets/images/New iconApp pre2-2.png",
                height: 400,
                width: double.infinity,
              ),
              SizedBox(
                height: 50,
              ),
              BtnLogin(),
              SizedBox(
                height: 100,
              ),
              Text(
                "<< Mee Report by Meepoong.com >>",
                style: TextStyle(fontSize: 15, color: Colors.white60),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

class BtnLogin extends StatelessWidget {
  const BtnLogin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        // ignore: deprecated_member_use
        FlatButton(
      minWidth: 150,
      height: 55,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: Colors.white60,
      child: Text(
        "เข้าสู่ระบบ/ลงทะเบียน",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.indigo,
        ),
      ),
      onPressed: () {
        FirebaseAuth.instance.authStateChanges().listen((User? user) {
          if (user == null) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => SignIn()),
              (Route<dynamic> route) => false,
            );
          } else {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => Home()),
              (Route<dynamic> route) => false,
            );
          }
        });
      },
    );
  }
}
