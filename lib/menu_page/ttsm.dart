import 'package:flutter/material.dart';

class TTSM extends StatelessWidget {
  const TTSM({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "TTSM",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.grey,
          ),
        ),
      ),
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
//////////////////////////////////////////////////////////////
class Body extends StatefulWidget {
  const Body({ Key? key }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}