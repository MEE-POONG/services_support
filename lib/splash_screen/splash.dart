import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
            image: AssetImage("assets/images/7.jpeg"),
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
              // Image.network("https://www.blognone.com/sites/default/files/externals/35a842375e95e8d7509488361ef619da.png",
              //   //"https://www.matichon.co.th/wp-content/uploads/2021/06/Pic01-AIS-%E0%B8%88%E0%B8%B1%E0%B8%9A%E0%B8%A1%E0%B8%B7%E0%B8%AD%E0%B8%9E%E0%B8%B2%E0%B8%A3%E0%B9%8C%E0%B8%97%E0%B9%80%E0%B8%99%E0%B8%AD%E0%B8%A3%E0%B9%8C%E0%B8%94%E0%B8%B9%E0%B9%81%E0%B8%A5%E0%B8%A5%E0%B8%B9%E0%B8%81%E0%B8%84%E0%B9%89%E0%B8%B2%E0%B9%83%E0%B8%99%E0%B9%81%E0%B8%84%E0%B8%A1%E0%B9%80%E0%B8%9B%E0%B8%8D%E0%B8%AA%E0%B8%B8%E0%B8%82%E0%B8%A0%E0%B8%B2%E0%B8%9E%E0%B8%94%E0%B8%B5%E0%B8%A7%E0%B8%B4%E0%B8%96%E0%B8%B5%E0%B9%83%E0%B8%AB%E0%B8%A1%E0%B9%88.jpg",
              //   height: 550,
              //   width: double.infinity,
              // ),
              Image.asset(
                "assets/images/backg.png",
                height: 400,
                width: double.infinity,
              ),

             Text("ประเทศไทยใครก็ได้",style: TextStyle(fontSize: 20),),
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
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: Colors.green[800],
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => SignIn(), //
            ),
          );
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
