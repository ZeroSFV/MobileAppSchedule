import 'package:flutter/material.dart';
import 'splashScreen.dart';

void main() {
  runApp(
    const MaterialApp(
      title: 'My app', // used by the OS task switcher
      home: SplashScreen(),
    ),
  );
}
