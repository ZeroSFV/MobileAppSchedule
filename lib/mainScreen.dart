import 'package:flutter/material.dart';
import 'navBar.dart';
import 'firstWeekScreen.dart';
import 'secondWeekScreen.dart';
import 'package:flutter_mobile_schedule/settings/settingsScreen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

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
                        fontSize: 20.0,
                        fontStyle: FontStyle.italic, // text size
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
                      padding: const EdgeInsets.all(20)),
                  child: const Text('Первая неделя'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FirstWeekScreen()),
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
                      padding: const EdgeInsets.all(20)),
                  child: const Text('Вторая неделя'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SecondWeekScreen()),
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
                      padding: const EdgeInsets.all(20)),
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
        bottomNavigationBar: const NavBar(selectedIndex: 1));
  }

  void _sendDataToSettingsScreen(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SettingsScreen(),
        ));
  }
}
