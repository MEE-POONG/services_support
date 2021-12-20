import 'package:flutter/material.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:services_support/menu_page/working/done/done.dart';

class Working extends StatelessWidget {
  const Working({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body()
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
  bool isOnsite = false;
  bool isDone = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Working",
          // "เลือกไซต์เพื่อเริ่มดำเนินการ",
          style: TextStyle(color: Colors.white),
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
        elevation: 10,
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
                  "รายละเอียดไซต์งาน : ",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // ignore: deprecated_member_use
              FlatButton(
                child: Row(
                  children: [
                    Text('Depart', style: TextStyle(color: Colors.white)),
                  ],
                ),
                color: Colors.purple,
                onPressed: () => MapsLauncher.launchCoordinates(
                    14.9698804, 102.1020475, 'MEE POONG CO., LTD.'),
              ),
              // ignore: deprecated_member_use
              FlatButton(
                  child: Text('Onsite', style: TextStyle(color: Colors.white)),
                  color: Colors.orange,
                  onPressed: () {
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Onsite'),
                        content: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 80),
                          child: const Text('ยืนยันสำเร็จ',style: TextStyle(fontSize: 18),),
                        ),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'OK'),
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );

                    setState(() {
                      isOnsite = true;
                    });
                  }),
              // ignore: deprecated_member_use
              FlatButton(
                  child: Text('Done', style: TextStyle(color: Colors.white)),
                  color: Colors.green,
                  onPressed: () {
                    setState(() {
                      isDone = true;
                    });
                  }),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          isDone == true
              ? SingleChildScrollView(
                  child: Container(
                    height: 620,
                    child: Done(),
                  ),
                )
              : Text(''),
        ],
      ),
    );
  }
}
