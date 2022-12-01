import 'package:flutter/material.dart';
import 'package:flutter_mobile_schedule/notes/notesJson.dart';
import '../navBar.dart';
import 'dart:convert';

import 'package:flutter/services.dart';

//import 'package:flutter_mobile_schedule/settings/settingsJson.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class NotesPage extends StatefulWidget {
  final String course;
  final String group;
  final String subgroup;
  final String day;
  final int week;
  const NotesPage(
      {super.key,
      required this.course,
      required this.group,
      required this.subgroup,
      required this.day,
      required this.week});

  @override
  State<NotesPage> createState() => _NotesPage(
      day,
      week.toString(),
      TextEditingController(text: "xd"),
      NotesJson(course, group, subgroup, day, week.toString(), ""));
}

class _NotesPage extends State<NotesPage> {
  String _day;
  String _week;
  TextEditingController textController;
  NotesJson _notesJson;
  _NotesPage(this._day, this._week, this.textController, this._notesJson);

  //SettingsJson _settingsJson = SettingsJson("Первый курс", "41", "x");

  // Future<void> readAssetJson() async {
  //   final String response = await rootBundle.loadString('assets/settings.json');
  //   final data = await json.decode(response);
  //   setState(() {
  //     _settingsJson.course = data["course"];
  //     _settingsJson.group = data["group"];
  //     _settingsJson.subgroup = data["subgroup"];
  //     readAssetNotesJson();
  //   });
  //   _settingsJson.writeJson();
  // }

  // Future<void> readFileSystemJson() async {
  //   final directory = await getApplicationDocumentsDirectory();
  //   final path = directory.path;
  //   final file = File('$path/settings.json');
  //   if (await file.exists()) {
  //     final content = await file.readAsString();
  //     setState(() {
  //       _settingsJson = SettingsJson.fromJson(jsonDecode(content));
  //       readFileSystemNotesJson();
  //     });
  //     return;
  //   }
  //   readAssetJson();
  //   return;
  // }

  Future<void> readAssetNotesJson() async {
    final String response = await rootBundle.loadString('assets/notes.json');
    final data = await json.decode(response);
    setState(() {
      // _notesJson.course = ;
      // _notesJson.group = data["group"];
      // _notesJson.subgroup = data["subgroup"];
      // _notesJson.day = data["day"];
      // _notesJson.week = data["week"];
      // _notesJson.note = data["note"];
      final String texting = _notesJson.note;

      textController = TextEditingController(text: _notesJson.note);
    });
    _notesJson.writeJson();
  }

  Future<void> readFileSystemNotesJson() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = directory.path;
    final file = File('$path/' +
        _notesJson.course +
        '_' +
        _notesJson.group +
        '_' +
        _notesJson.subgroup +
        '_' +
        _day +
        '_' +
        _week +
        '.json');
    if (await file.exists()) {
      final content = await file.readAsString();
      setState(() {
        _notesJson = NotesJson.fromJson(jsonDecode(content));
        textController = TextEditingController(text: _notesJson.note);
      });
      return;
    }
    readAssetNotesJson();
    return;
  }

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      readFileSystemNotesJson();
    });
    super.initState();
  }

  List _items = [];

  // Fetch content from the json file
  // Future<void> readJson(day) async {
  //   final String response =
  //       await rootBundle.loadString('assets/firstWeek.json');
  //   final data = await json.decode(response);
  //   setState(() {
  //     _items = data[day];
  //   });
  // }

  TextStyle getTextStyle(bool Selected) {
    if (Selected == true)
      return const TextStyle(fontSize: 20, color: Color.fromARGB(255, 0, 0, 0));
    else
      return const TextStyle(
          fontSize: 20, color: const Color.fromARGB(255, 163, 163, 163));
  }

  String getRussianDayOfWeek(String dayOfWeek) {
    if (dayOfWeek == "monday") {
      return "Понедельник";
    } else if (dayOfWeek == "tuesday") {
      return "Вторник";
    } else if (dayOfWeek == "wednesday") {
      return "Среда";
    } else if (dayOfWeek == "thursday") {
      return "Четверг";
    } else if (dayOfWeek == "friday") {
      return "Пятница";
    } else if (dayOfWeek == "Saturday") {
      return "Суббота";
    } else {
      return "Воскресенье";
    }
  }

  void _onBackTapped(BuildContext context) {
    Navigator.pop(context);
  }

  void onAcceptTapped(BuildContext context) {
    Navigator.pop(context);
    _notesJson.writeJson();
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
              child: Center(
                  child: (_week == 1)
                      ? Text("Первая неделя",
                          style: TextStyle(
                            fontSize: 20.0, // text size
                            color: Color.fromARGB(255, 0, 0, 0), // text color
                          ))
                      : Text("Вторая неделя",
                          style: TextStyle(
                            fontSize: 20.0, // text size
                            color: Color.fromARGB(255, 0, 0, 0),
                          )))),
          Container(
              height: 47,
              color: Color.fromARGB(255, 255, 255, 255),
              child: Center(
                  child: Text(getRussianDayOfWeek(_day) + " - заметки",
                      style: TextStyle(
                        fontSize: 20.0, // text size
                        color: Color.fromARGB(255, 0, 0, 0), // text color
                      )))),
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
              child: Expanded(
                  child: TextField(
                controller: textController,
                textInputAction: TextInputAction.newline,
                keyboardType: TextInputType.multiline,
                minLines: null,
                maxLines:
                    null, // If this is null, there is no limit to the number of lines, and the text container will start with enough vertical space for one line and automatically grow to accommodate additional lines as they are entered.
                expands: true,
                onChanged: (value) => _notesJson.note = value,
              ))),
          Row(children: [
            Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  child: Container(
                    height: 50,
                    width: 50,
                    margin: const EdgeInsets.only(left: 40.0),
                    decoration: const BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: const Expanded(child: Icon(Icons.arrow_back)),
                  ),
                  onTap: () => {_onBackTapped(context)},
                )),
            Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  child: Container(
                    height: 50,
                    width: 50,
                    margin: const EdgeInsets.only(left: 180.0),
                    decoration: const BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: const Expanded(child: Icon(Icons.check)),
                  ),
                  onTap: () => {onAcceptTapped(context)},
                ))
          ])
        ]),
        backgroundColor: Colors.blue,
        bottomNavigationBar: NavBar(selectedIndex: 2));
  }
}
