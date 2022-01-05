import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:services_support/home/home.dart';
import 'package:services_support/splash_screen/splash.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}

//////////////////////////////////////////////////////////
class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool checkBox0 = false;
  bool checkBox1 = false;
  bool checkBox2 = false;
  bool checkBox3 = false;
  bool checkBox4 = false;
  bool checkBox5 = false;

  bool showPassword = false;
  String? _currentUserId = FirebaseAuth.instance.currentUser?.uid;

  TextEditingController nameController = TextEditingController();
  TextEditingController phonController = TextEditingController();
  TextEditingController teamController = TextEditingController();
  TextEditingController passportController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    getWorkCollection();
  }

  final _fireStore = FirebaseFirestore.instance;
  Future<List<dynamic>?> getWorkCollection() async {
    DocumentSnapshot<Map<String, dynamic>> querySnapshot1 =
        await _fireStore.collection('user').doc(_currentUserId).get();
    print(querySnapshot1.get('Team'));
    teamController.text = querySnapshot1.get('Team');
    locationController.text = querySnapshot1.get('Location');
    nameController.text = querySnapshot1.get('displayName');
    passportController.text = querySnapshot1.get('passport');
    phonController.text = querySnapshot1.get('phoneNumber');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
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
              Icons.settings,
              color: Colors.black,
            ),
            onPressed: () {
              // Navigator.of(context).push(MaterialPageRoute(
              //     builder: (BuildContext context) => SettingsPage()));
            },
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
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Text("User Profile",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 4,
                            color: Theme.of(context).scaffoldBackgroundColor),
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.1),
                              offset: Offset(0, 10))
                        ],
                        shape: BoxShape.circle,
                        // image: DecorationImage(
                        //   fit: BoxFit.cover,
                        //   image: AssetImage(
                        //     "assets/images/AJ_Call_center.png",
                        //   ),
                        // ),
                      ),
                    ),
                    // Positioned(
                    //     bottom: 0,
                    //     right: 0,
                    //     child: Container(
                    //       height: 40,
                    //       width: 40,
                    //       decoration: BoxDecoration(
                    //         shape: BoxShape.circle,
                    //         border: Border.all(
                    //           width: 4,
                    //           color: Theme.of(context).scaffoldBackgroundColor,
                    //         ),
                    //         color: Colors.lightBlue,
                    //       ),
                    //       child: Icon(
                    //         Icons.edit,
                    //         color: Colors.white,
                    //       ),
                    //     )),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: Column(
                  children: [
                    Form(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                child: SizedBox(
                                  width: 200,
                                  child: buildTextField(
                                    "ชื่อ-สกุล",
                                    "",
                                    nameController,
                                  ),
                                ),
                              ),

                              // SizedBox(height: 10,),
                              Container(
                                child: SizedBox(
                                  width: 120,
                                  child: buildTextField(
                                    "เบอร์โทร",
                                    "",
                                    phonController,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                child: SizedBox(
                                  width: 200,
                                  child: buildTextField(
                                    "หมายเลขบัตรประชาชน",
                                    "",
                                    passportController,
                                  ),
                                ),
                              ),

                              //  SizedBox(height: 10,),
                              Container(
                                child: SizedBox(
                                  width: 120,
                                  child: buildTextField(
                                    "Team",
                                    "",
                                    teamController,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            child: SizedBox(
                              width: 330,
                              child: buildTextField(
                                "Location",
                                "",
                                locationController,
                              ),
                            ),
                          ),
                          SizedBox(height: 30),
                          // Text(
                          //   'ข้อมูลอบรม AIS Passport',
                          //   textAlign: TextAlign.center,
                          //   style: TextStyle(
                          //     fontSize: 20.0,
                          //     color: Colors.blue,
                          //   ),
                          // ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: <Widget>[
                          //     Checkbox(
                          //       value: checkBox0,
                          //       onChanged: (value) {
                          //         setState(() {
                          //           this.checkBox0 = value!;
                          //         });
                          //       },
                          //     ),
                          //     Text("G-ทั่วไป"),
                          //     Checkbox(
                          //       value: checkBox1,
                          //       onChanged: (value) {
                          //         setState(() {
                          //           this.checkBox1 = value!;
                          //         });
                          //       },
                          //     ),
                          //     Text("E-ไฟฟ้า"),
                          //     Checkbox(
                          //       value: checkBox2,
                          //       onChanged: (value) {
                          //         setState(() {
                          //           this.checkBox2 = value!;
                          //         });
                          //       },
                          //     ),
                          //     Text("T-ที่สูง"),
                          //   ],
                          // ),
                          // Divider(height: 15, thickness: 2),
                          // Text(
                          //   'ข้อมูลอบรม Lotus Passport',
                          //   textAlign: TextAlign.center,
                          //   style: TextStyle(
                          //     fontSize: 20.0,
                          //     color: Colors.blue,
                          //   ),
                          // ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: <Widget>[
                          //     Checkbox(
                          //       value: checkBox3,
                          //       onChanged: (value) {
                          //         setState(() {
                          //           this.checkBox3 = value!;
                          //         });
                          //       },
                          //     ),
                          //     Text("Lotus G"),
                          //     Checkbox(
                          //       value: checkBox4,
                          //       onChanged: (value) {
                          //         setState(() {
                          //           this.checkBox4 = value!;
                          //         });
                          //       },
                          //     ),
                          //     Text("Lotus E"),
                          //     Checkbox(
                          //       value: checkBox5,
                          //       onChanged: (value) {
                          //         setState(() {
                          //           this.checkBox5 = value!;
                          //         });
                          //       },
                          //     ),
                          //     Text("Lotus S,P"),
                          //   ],
                          // ),
                          // Divider(height: 15, thickness: 2),
                        ],
                      ),
                    ),
                    // SizedBox(
                    //   height: 35,
                    // ),
                    // SizedBox(
                    //   width: double.infinity, // <-- match_parent
                    //   child: RaisedButton(
                    //     onPressed: () {},
                    //     color: Colors.lightBlue,
                    //     padding: EdgeInsets.symmetric(horizontal: 20),
                    //     elevation: 2,
                    //     shape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(20)),
                    //     child: Text(
                    //       "SAVE",
                    //       style: TextStyle(
                    //         fontSize: 14,
                    //         letterSpacing: 2.2,
                    //         color: Colors.white,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 35,
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // ignore: deprecated_member_use
                        OutlineButton(
                          padding: EdgeInsets.symmetric(horizontal: 45),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("BACK",
                              style: TextStyle(
                                  fontSize: 14,
                                  letterSpacing: 2.2,
                                  color: Colors.black)),
                        ),
                        // ignore: deprecated_member_use
                        RaisedButton(
                          onPressed: () {
                            _auth.signOut();
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SplashSrceen()),
                              ModalRoute.withName('/'),
                            );
                          },
                          color: Colors.lightBlue,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            "SIGN OUT",
                            style: TextStyle(
                                fontSize: 14,
                                letterSpacing: 2.2,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
    String labelText,
    String placeholder,
    TextEditingController controller,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(bottom: 1),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
    );
  }
}
