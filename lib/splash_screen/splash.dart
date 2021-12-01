import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:services_support/home/home.dart';
import 'package:services_support/login/login.dart';

class SplashSrceen extends StatelessWidget {
  const SplashSrceen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/1111.png"),
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
                "assets/images/MEE POONG GROUP-03 (1).png",
                height: 500,
                width: double.infinity,
              ),

              //Text("ประเทศไทยใครก็ได้",style: TextStyle(fontSize: 20),),
              Padding(padding: EdgeInsets.all(10)),

              BtnLogin(),
              Spacer()
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
    return SizedBox(
      width: 250,
      height: 60,
      // ignore: deprecated_member_use
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: Colors.lightBlue,
        onPressed: () {
          FirebaseAuth.instance.authStateChanges().listen((User? user) {
            if (user == null) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => SignIn()),
                ModalRoute.withName('/'),
              );
            } else {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => Home()),
                ModalRoute.withName('/'),
              );
            }
          });
        },
        child: Text(
          "เข้าสู่ระบบ/ลงทะเบียน",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
