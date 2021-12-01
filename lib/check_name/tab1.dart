import 'package:flutter/material.dart';
import 'package:services_support/check_name/tab2.dart';

class Tab1 extends StatefulWidget {
  const Tab1({Key? key}) : super(key: key);

  @override
  _Tab1State createState() => _Tab1State();
}

class _Tab1State extends State<Tab1> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'เพิ่มชื่อ',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: BottomSheetExample(),
              ),
            ),
          );
        },
        child: Icon(Icons.add),
      ), 
    );

    // return Scaffold(
    //   body: MouseRegion(
    //       onHover: (h) {
    //         var pointerEvent = h;
    //       },
    //       child: PopupMenuButton<int>(
    //         child: Text("เพิ่ม",
    //             style: TextStyle(
    //               fontSize: 28,
    //             )),
    //         itemBuilder: (context) {
    //           return [
    //             PopupMenuItem<int>(value: 1, child: Text("View")),
    //             PopupMenuItem<int>(value: 2, child: Text("Share")),
    //           ];
    //         },
    //         onSelected: (value) {
    //           //
    //         },
    //       )
    //////////////////////////////////
    // SizedBox(
    //     height: 50,
    //   ),
    //   Text("", style: TextStyle(fontSize: 20)),
    //   Padding(
    //     padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),

    //   ),
    //   Row(
    //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //     children: [
    //       // ignore: deprecated_member_use
    //       TextButton(
    //         child: Text("เพื่ม"),
    //         onPressed: () {},

    //       ),
    //     ],
    // ),
  }
}

class BottomSheetExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'เพิ่มรายชื่อ',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.blue,
              ),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (newText) {},
            ),
            FlatButton(
              child: Text(
                'Close',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
