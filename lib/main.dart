import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';

import 'frontScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Virtual Tourist Guide',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'GoogleSans', primaryColor: Colors.red),
      home: BackButton(),
    );
  }
}

class BackButton extends StatefulWidget {
  @override
  _BackButtonState createState() => _BackButtonState();
}

class _BackButtonState extends State<BackButton> {
  DateTime backbuttonpressedTime;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: SplashScreen(),
      // child: ,
    );
  }

  Future<bool> onWillPop() async {
    DateTime currentTime = DateTime.now();

    bool backButton = backbuttonpressedTime == null ||
        currentTime.difference(backbuttonpressedTime) > Duration(seconds: 3);

    if (backButton) {
      backbuttonpressedTime = currentTime;
      Fluttertoast.showToast(
          msg: "Double Click to exit",
          backgroundColor: Colors.black,
          textColor: Colors.white);
      return false;
    }
    return true;
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, CupertinoPageRoute(builder: (context) => FrontScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8CB5A),
      body: Column(
        children: [
          SizedBox(
            height: 150,
          ),
          Lottie.asset('assets/travel2.json'),
          Padding(
            padding: const EdgeInsets.only(top: 50.0, left: 10, right: 10),
            child: Text(
              'VIRTUAL TOURIST GUIDE',
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 30,
                  fontFamily: 'GoogleSans'),
            ),
          )
        ],
        // child: Lottie.asset('assets/travel2.json'),
      ),
    );
  }
}
