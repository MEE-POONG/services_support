import 'package:flutter/material.dart';

class GradientAppBarFb1 extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  GradientAppBarFb1({Key? key})
      : preferredSize = const Size.fromHeight(56.0),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xff4338CA);
    const secondaryColor = Color(0xff6D28D9);
    // ignore: unused_local_variable
    const accentColor = Color(0xffffffff);
    // ignore: unused_local_variable
    const backgroundColor = Color(0xffffffff);
    // ignore: unused_local_variable
    const errorColor = Color(0xffEF4444);

    return AppBar(
      title:
          const Text("Flutter Bricks", style: TextStyle(color: Colors.white)),
      backgroundColor: primaryColor,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [primaryColor, secondaryColor],
            stops: [0.5, 1.0],
          ),
        ),
      ),
    );
  }
}