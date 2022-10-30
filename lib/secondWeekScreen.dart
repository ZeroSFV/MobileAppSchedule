import 'package:flutter/material.dart';
import 'navBar.dart';
import 'dart:convert';

import 'package:flutter/services.dart';

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
  int xd = 0;
  String Day = "monday";
  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      if (selectedIndex == 0) {
        Day = "monday";
        readJson(Day);
      }
      if (selectedIndex == 1) {
        Day = "tuesday";
        readJson(Day);
      }
      if (selectedIndex == 2) {
        Day = "wednesday";
        readJson(Day);
      }
      if (selectedIndex == 3) {
        Day = "thursday";
        readJson(Day);
      }
      if (selectedIndex == 4) {
        Day = "friday";
        readJson(Day);
      }
      if (selectedIndex == 5) {
        Day = "saturday";
        readJson(Day);
      }
      if (selectedIndex == 6) {
        Day = "sunday";
        readJson(Day);
      }
    });
  }

  List _items = [];

  // Fetch content from the json file
  Future<void> readJson(day) async {
    final String response =
        await rootBundle.loadString('assets/secondWeek.json');
    final data = await json.decode(response);
    setState(() {
      _items = data[day];
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
    readJson(Day);
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
              )),
          Container(
              // color: Colors.white,
              height: 380,
              margin: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Column(children: [
                Flexible(
                    child: GridView.count(
                        padding: EdgeInsets.only(top: 15.0),
                        primary: false,
                        // physics: NeverScrollableScrollPhysics(),
                        crossAxisCount: 1,
                        childAspectRatio: 6.80,
                        // crossAxisSpacing: 8,
                        // mainAxisSpacing: 1,
                        //mainAxisSpacing: 10,
                        children: _items
                            .map((item) => Wrap(children: [
                                  Container(
                                      height: 50,
                                      width: 97,
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        border: Border.all(
                                          color: Color.fromARGB(255, 0, 0, 0),
                                        ),
                                      ),
                                      child: Center(child: Text(item['time']))),
                                  Container(
                                      height: 50,
                                      width: 241,
                                      decoration: BoxDecoration(
                                        color: (item['pair']
                                                    .toString()
                                                    .contains("лек.") ==
                                                true)
                                            ? Color.fromARGB(255, 255, 246, 198)
                                            : (item['pair']
                                                        .toString()
                                                        .contains("лаб.") ==
                                                    true)
                                                ? Color.fromARGB(
                                                    255, 255, 170, 251)
                                                : ((item['pair']
                                                                .toString()
                                                                .contains(
                                                                    "к.раб.") ==
                                                            true) ||
                                                        (item['pair']
                                                                .toString()
                                                                .contains(
                                                                    "сем.") ==
                                                            true) ||
                                                        (item['pair']
                                                                .toString()
                                                                .contains(
                                                                    "к.пр.") ==
                                                            true))
                                                    ? Color.fromARGB(
                                                        255, 175, 255, 183)
                                                    : Colors.white,
                                        border: Border.all(
                                          color: Color.fromARGB(255, 0, 0, 0),
                                        ),
                                      ),
                                      child: Center(
                                          child: Text(
                                        item['pair'],
                                        textAlign: TextAlign.center,
                                      )))
                                ]))
                            .toList()))
              ]))
        ]),
        backgroundColor: Colors.blue,
        bottomNavigationBar: NavBar(
            selectedIndex: 0,
            groupNav: widget.group,
            courseNav: widget.course));
  }
}




//  Center(
//           child: ElevatedButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             child: const Text('Go back!'),
//           ),
//         ),