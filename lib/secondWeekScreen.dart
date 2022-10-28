import 'package:flutter/material.dart';
import 'navBar.dart';

class SecondWeekScreen extends StatefulWidget {
  final String group;
  final String course;
  const SecondWeekScreen(
      {super.key, required this.group, required this.course});

  @override
  State<SecondWeekScreen> createState() => _SecondWeekScreen();
}

class _SecondWeekScreen extends State<SecondWeekScreen> {
  int selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  TextStyle getTextStyle(bool Selected) {
    if (Selected == true)
      return const TextStyle(fontSize: 20, color: Color.fromARGB(255, 0, 0, 0));
    else
      return const TextStyle(
          fontSize: 20, color: const Color.fromARGB(255, 163, 163, 163));
  }

  @override
  Widget build(BuildContext context) {
    TextStyle FirstStyle = getTextStyle(true);
    TextStyle SecondStyle = getTextStyle(false);
    return Scaffold(
        body: Column(mainAxisSize: MainAxisSize.max, children: [
          Container(
              height: 47,
              color: Color.fromARGB(255, 213, 213, 213),
              child: const Center(
                  child: Text("Вторая неделя",
                      style: TextStyle(
                        fontSize: 20.0, // text size
                        color: Color.fromARGB(255, 0, 0, 0), // text color
                      )))),
          Container(
              height: 49,
              color: Colors.white,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  GestureDetector(
                    child: Container(
                        width: 158,
                        color: Color.fromARGB(255, 255, 255, 255),
                        child: Center(
                            child: Text(
                          'Понедельник',
                          style:
                              (selectedIndex == 0) ? FirstStyle : SecondStyle,
                        ))),
                    onTap: () => {_onItemTapped(0)},
                  ),
                  GestureDetector(
                    child: Container(
                      width: 158,
                      color: Color.fromARGB(255, 255, 255, 255),
                      child: Center(
                          child: Text(
                        'Вторник',
                        style: (selectedIndex == 1) ? FirstStyle : SecondStyle,
                      )),
                    ),
                    onTap: () => {_onItemTapped(1)},
                  ),
                  GestureDetector(
                    child: Container(
                      width: 158,
                      color: Color.fromARGB(255, 255, 255, 255),
                      child: Center(
                          child: Text(
                        'Среда',
                        style: (selectedIndex == 2) ? FirstStyle : SecondStyle,
                      )),
                    ),
                    onTap: () => {_onItemTapped(2)},
                  ),
                  GestureDetector(
                    child: Container(
                      width: 158,
                      color: Color.fromARGB(255, 255, 255, 255),
                      child: Center(
                          child: Text(
                        'Четверг',
                        style: (selectedIndex == 3) ? FirstStyle : SecondStyle,
                      )),
                    ),
                    onTap: () => {_onItemTapped(3)},
                  ),
                  GestureDetector(
                    child: Container(
                      width: 158,
                      color: Color.fromARGB(255, 255, 255, 255),
                      child: Center(
                          child: Text(
                        'Пятница',
                        style: (selectedIndex == 4) ? FirstStyle : SecondStyle,
                      )),
                    ),
                    onTap: () => {_onItemTapped(4)},
                  ),
                  GestureDetector(
                    child: Container(
                      width: 158,
                      color: Color.fromARGB(255, 255, 255, 255),
                      child: Center(
                          child: Text(
                        'Суббота',
                        style: (selectedIndex == 5) ? FirstStyle : SecondStyle,
                      )),
                    ),
                    onTap: () => {_onItemTapped(5)},
                  ),
                  GestureDetector(
                    child: Container(
                      width: 158,
                      color: Color.fromARGB(255, 255, 255, 255),
                      child: Center(
                          child: Text(
                        'Воскресенье',
                        style: (selectedIndex == 6) ? FirstStyle : SecondStyle,
                      )),
                    ),
                    onTap: () => {_onItemTapped(6)},
                  )
                ],
              ))
        ]),
        backgroundColor: Colors.blue,
        bottomNavigationBar: NavBar(
            selectedIndex: 0,
            groupNav: widget.group,
            courseNav: widget.course));
  }
}
