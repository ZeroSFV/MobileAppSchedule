import 'package:flutter/material.dart';
import 'navBar.dart';
import 'dart:convert';
import 'notes/notesPage.dart';

import 'package:flutter/services.dart';

import 'package:flutter_mobile_schedule/settings/settingsJson.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class FirstWeekScreen extends StatefulWidget {
  const FirstWeekScreen({super.key});

  @override
  State<FirstWeekScreen> createState() => _FirstWeekScreen();
}

class _FirstWeekScreen extends State<FirstWeekScreen> {
  int selectedIndex = 0;
  int xd = 0;
  String Day = "monday";
  SettingsJson _settingsJson = SettingsJson("Первый курс", "41", "x");

  Future<void> readAssetJson() async {
    final String response = await rootBundle.loadString('assets/settings.json');
    final data = await json.decode(response);
    setState(() {
      _settingsJson.course = data["course"];
      _settingsJson.group = data["group"];
      _settingsJson.subgroup = data["subgroup"];
    });
    _settingsJson.writeJson();
  }

  Future<void> readFileSystemJson() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = directory.path;
    final file = File('$path/settings.json');
    if (await file.exists()) {
      final content = await file.readAsString();
      setState(() {
        _settingsJson = SettingsJson.fromJson(jsonDecode(content));
      });
      return;
    }
    readAssetJson();
    return;
  }

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

  void _onNotesTapped(BuildContext context, String _Day) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NotesPage(
              course: _settingsJson.course,
              group: _settingsJson.group,
              subgroup: _settingsJson.subgroup,
              day: _Day,
              week: 1),
        ));
  }

  List _items = [];

  // Fetch content from the json file
  Future<void> readJson(day) async {
    final String response =
        await rootBundle.loadString('assets/firstWeek.json');
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

  void initState() {
    Future.delayed(Duration.zero, () async {
      readJson(Day);
      readFileSystemJson();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //readJson(Day);
    TextStyle FirstStyle = getTextStyle(true);
    TextStyle SecondStyle = getTextStyle(false);
    return Scaffold(
        body: Column(mainAxisSize: MainAxisSize.max, children: [
          Container(
              height: 47,
              color: Color.fromARGB(255, 213, 213, 213),
              child: const Center(
                  child: Text("Первая неделя",
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
              ])),
          Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                child: Container(
                  height: 45,
                  width: 50,
                  margin: const EdgeInsets.only(right: 20.0),
                  decoration: const BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: const Expanded(child: Icon(Icons.create)),
                ),
                onTap: () => {_onNotesTapped(context, Day)},
              ))
        ]),
        backgroundColor: Colors.blue,
        bottomNavigationBar: NavBar(selectedIndex: 0));
  }
}
