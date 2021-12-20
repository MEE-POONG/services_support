import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:services_support/home/home.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

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
      appBar: AppBar(),

      // body: Body(),
    );
  }
}

///////////////////////////////////////////////////
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
          padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
          child: Column(
            children: <Widget>[
              Text(
                "Mee Report",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                "บริการทุกระดับ ประทับใจ...🖤",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ),
              SignForm() //
            ],
          ),
        ),
      ),
    );
  }
}

////////////////////////////////////////////////////////
class SignForm extends StatefulWidget {
  const SignForm({Key? key}) : super(key: key);

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool checkBox = false;
  signIn() {
    _auth
        .signInWithEmailAndPassword(
      email: _email.text,
      password: _password.text,
    )
        .then((user) {
      print(user);
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => Home(),
        ),
      );
    }).catchError((error) {
      print(error);
      print(error.message);
      // ignore: deprecated_member_use
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(error.message, style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.red,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            Image.asset(
              "assets/images/New iconApp pre2-2.png",
              height: 200,
              width: 200,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                  controller: _email,
                  decoration: InputDecoration(
                      // labelText: "Username ID",
                      hintText: "      Username ID",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                      )),
                  textAlign: TextAlign.start),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,),
              child: TextFormField(
                  obscureText: true,
                  controller: _password,
                  decoration: InputDecoration(
                      // labelText: "Password",
                      hintText: '     Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                      )),
                  textAlign: TextAlign.start),
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Checkbox(
                  value: checkBox,
                  activeColor: Colors.green,
                  onChanged: (value) {
                    setState(() {
                      checkBox = value!;
                    });
                  },
                ),
                Text("จดจำรหัสผ่าน"),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                height: 50,
                width: 150,
                // ignore: deprecated_member_use
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: Colors.lightBlueAccent,
                  onPressed: () {
                    signIn();
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Text(
              "<< ยินดีต้อนรับสู่ Mee Report >>",
              style: TextStyle(fontSize: 15, color: Colors.white60),
            ),
          ],
        ),
      ),
    );
  }
}
