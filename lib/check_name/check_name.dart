import 'package:flutter/material.dart';
import 'package:services_support/check_name/tab1.dart';
import 'package:services_support/home/home.dart';

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
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Home()));
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
  String dropdownValue = 'Name';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Tab1(),
      //  Column(
      //   children: [
      //     SizedBox(height: 0),
      //     Container(
      //       decoration: BoxDecoration(
      //         gradient: LinearGradient(
      //           colors: [Colors.deepPurple, Colors.lightBlue],
      //         ),
      //       ),
      //       height: 50,
      //       padding: EdgeInsets.symmetric(horizontal: 15),
      //       child: Row(
      //         children: [
      //           Text(
      //             "แจ้งรายชื่อผู้ปฏิบัติงานประจำวันที่:",
      //             style: TextStyle(color: Colors.white, fontSize: 15),
      //           ),
      //         ],
      //       ),
      //     ),
      //     SizedBox(height: 100,),
      //     Container(
      //       height: 200,
      //       child: Padding(
      //         padding: const EdgeInsets.all(20.0),
      //         child: Column(
      //           mainAxisAlignment: MainAxisAlignment.start,
      //           children: [
      //             Row(
      //               children: [
      //                 Text(
      //                   "1. ",
      //                   style: TextStyle(color: Colors.black, fontSize: 15),
      //                 ),
      //                 // DropdownButton<String>(
      //                 //   iconSize: 30,
      //                 //   value: dropdownValue,
      //                 //   onChanged: (String? newValue) {
      //                 //     setState(() {
      //                 //       dropdownValue = newValue!;
      //                 //     });
      //                 //   },
      //                 //   items: <String>[
      //                 //     'สิทธิกร ครบกลาง T121',
      //                 //     'ยุรนันท์ ประจวบสุข T122',
      //                 //     'วราวุธ เทกระโทก T123',
      //                 //     'พยุงศักดิ์ ขนุนสูงเนิน T124'
      //                 //   ].map<DropdownMenuItem<String>>((String value) {
      //                 //     return DropdownMenuItem<String>(
      //                 //       value: value,
      //                 //       child: Text(value),
      //                 //     );
      //                 //   }).toList(),
      //                 // ),
      //               ],
      //             ),
      //             Row(
      //               mainAxisAlignment: MainAxisAlignment.start,
      //               children: [
      //                 Text(
      //                   "2. ",
      //                   style: TextStyle(color: Colors.black, fontSize: 15),
      //                 ),
      //                 // DropdownButton<String>(
      //                 //   value: dropdownValue,
      //                 //   iconSize: 30,
      //                 //   style: const TextStyle(
      //                 //       color: Colors.deepPurple, fontSize: 16),
      //                 //   underline: Container(
      //                 //     height: 1,
      //                 //     color: Colors.deepPurpleAccent,
      //                 //   ),
      //                 //   onChanged: (String? newValue) {
      //                 //     setState(() {
      //                 //       dropdownValue = newValue!;
      //                 //     });
      //                 //   },
      //                 //   items: <String>[
      //                 //     'สิทธิกร ครบกลาง T121',
      //                 //     'ยุรนันท์ ประจวบสุข T122',
      //                 //     'วราวุธ เทกระโทก T123',
      //                 //     'พยุงศักดิ์ ขนุนสูงเนิน T124'
      //                 //   ].map<DropdownMenuItem<String>>((String value) {
      //                 //     return DropdownMenuItem<String>(
      //                 //       value: value,
      //                 //       child: Text(value),
      //                 //     );
      //                 //   }).toList(),
      //                 // )
      //               ],
      //             ),
      //           ],
      //         ),
      //       ),
      //     ),
      //    SizedBox(height: 100,),
      //     Container(
      //       decoration: BoxDecoration(
      //         gradient: LinearGradient(
      //           colors: [Colors.deepPurple, Colors.lightBlue],
      //         ),
      //       ),
      //       height: 50,
      //       padding: EdgeInsets.symmetric(horizontal: 15),
      //       child: Row(
      //         children: [
      //           Text(
      //             "ใบงานทั้งหมดในSMS",
      //             style: TextStyle(color: Colors.white, fontSize: 15),
      //           ),
      //         ],
      //       ),
      //     ),
      //     Row(
      //       children: [
      //         Padding(
      //           padding:
      //               const EdgeInsets.symmetric(vertical: 0, horizontal: 100),
      //           child: TextField(
      //             decoration: InputDecoration(labelText: "ระบุการแก้ไข"),
      //             // textAlign: TextAlign.center,
      //             onChanged: (newText) {},
      //           ),
      //         ),
      //       ],
      //     ),
      //   ],
      // ),
    );
  }
}
