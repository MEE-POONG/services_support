import 'package:flutter/material.dart';
import 'package:services_support/home/bottomnavbar.dart';

class Report extends StatelessWidget {
  const Report({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Report",
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
      bottomNavigationBar: BottomNavBarFb5(
        i: 5,
      ),
    );
  }
}

///////////////////////////////////////////////////////////
class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple, Colors.lightBlue],
            ),
          ),
          height: 50,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Today Report all job",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        Container(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // ignore: deprecated_member_use
                  OutlinedButton(
                    child: Text("โหลดตัวอย่างรายงาน"),
                    onPressed: () {},
                  ),
                  // ignore: deprecated_member_use
                  RaisedButton(
                    child: Text("ส่งรายงาน"),
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(height: 30),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 10,
                  // controller: Data2,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
