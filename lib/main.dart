import 'package:flutter/material.dart';
import 'splash_screen/splash.dart';

// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatefulWidget {
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  // Set default `_initialized` and `_error` state to false
  bool _initialized = false;
  bool _error = false;

  // Define an async function to initialize FlutterFire
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Show error message if initialization failed
    if (_error) {
      return Text('ERROR');
    }

    // Show a loader until FlutterFire is initialized
    if (!_initialized) {
      return Text('loading...');
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Service Support',
      theme: ThemeData(
        fontFamily: 'K2D',
        appBarTheme: AppBarTheme(
          color: Colors.white10,
          elevation: 0,
          // ignore: deprecated_member_use
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
