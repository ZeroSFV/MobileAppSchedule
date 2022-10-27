import 'package:flutter/material.dart';
import 'navBar.dart';

class SecondWeekScreen extends StatelessWidget {
  final String group;
  final String course;
  const SecondWeekScreen(
      {super.key, required this.group, required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Second Route'),
        ),
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
