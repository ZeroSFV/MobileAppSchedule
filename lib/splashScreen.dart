import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_mobile_schedule/settings/beginningScreen.dart';

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
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const BeginningScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
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
                  fontSize: 24.0,
                  fontStyle: FontStyle.italic, // text size
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
