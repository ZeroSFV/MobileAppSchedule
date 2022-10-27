import 'package:flutter/material.dart';
import 'dart:async';
import 'beginningScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    new Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => BeginningScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        // logo her
        child: SizedBox(
          height: 100,
          width: 300,
          child: Center(
            child: Expanded(
              child: Text(
                "Мое расписание занятий",
                style: TextStyle(
                  fontSize: 24.0, // text size
                  color: Colors.white, // text color
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
