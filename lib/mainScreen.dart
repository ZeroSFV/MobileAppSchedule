import 'package:flutter/material.dart';
import 'navBar.dart';
import 'settingsScreen.dart';
import 'firstWeekScreen.dart';
import 'secondWeekScreen.dart';

class MainScreen extends StatelessWidget {
  final String group;
  final String course;
  const MainScreen({super.key, required this.group, required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 100,
                width: 300,
                child: Center(
                  child: Expanded(
                    child: Text(
                      "Мое расписание занятий",
                      style: TextStyle(
                        fontSize: 20.0, // text size
                        color: Colors.white, // text color
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              SizedBox(
                height: 100,
                width: 300,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      textStyle: const TextStyle(fontSize: 20),
                      shape: RoundedRectangleBorder(
                          //to set border radius to button
                          borderRadius: BorderRadius.circular(30)),
                      padding: EdgeInsets.all(20)),
                  child: const Text('Первая неделя'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              FirstWeekScreen(group: group, course: course)),
                    );
                  },
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                height: 100,
                width: 300,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      textStyle: const TextStyle(fontSize: 20),
                      shape: RoundedRectangleBorder(
                          //to set border radius to button
                          borderRadius: BorderRadius.circular(30)),
                      padding: EdgeInsets.all(20)),
                  child: const Text('Вторая неделя'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              SecondWeekScreen(group: group, course: course)),
                    );
                  },
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                height: 100,
                width: 300,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      textStyle: const TextStyle(fontSize: 20),
                      shape: RoundedRectangleBorder(
                          //to set border radius to button
                          borderRadius: BorderRadius.circular(30)),
                      padding: EdgeInsets.all(20)),
                  child: const Text('Настройки'),
                  onPressed: () {
                    Navigator.pop(context);
                    _sendDataToSettingsScreen(context);
                  },
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.blue,
        bottomNavigationBar:
            NavBar(selectedIndex: 1, groupNav: group, courseNav: course));
  }

  void _sendDataToSettingsScreen(BuildContext context) {
    String groupToSend = group;
    String courseToSend = course;
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SettingsScreen(
            group: groupToSend,
            course: courseToSend,
          ),
        ));
  }
}
