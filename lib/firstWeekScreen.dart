import 'package:flutter/material.dart';
import 'navBar.dart';

class FirstWeekScreen extends StatelessWidget {
  final String group;
  final String course;
  const FirstWeekScreen({super.key, required this.group, required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Go back!'),
          ),
        ),
        backgroundColor: Colors.blue,
        bottomNavigationBar:
            NavBar(selectedIndex: 0, groupNav: group, courseNav: course));
  }
}
