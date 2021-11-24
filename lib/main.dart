import 'package:flutter/material.dart';

import 'splash_screen/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Service Support',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.white10,
          elevation: 0,
          brightness: Brightness.light,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
      ),
      home: SplashSrceen(),
    );
  }
}
