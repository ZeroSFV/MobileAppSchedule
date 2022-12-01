import 'package:flutter/material.dart';
import 'package:flutter_mobile_schedule/navBar.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_mobile_schedule/mainScreen.dart';
import 'package:flutter_mobile_schedule/settings/settingsJson.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

final List<String> itemsCourse = [
  'Первый курс',
  'Второй курс',
  'Третий курс',
  'Четвертый курс',
  'Пятый курс',
];
String? selectedValueCouse;

class BeginningScreen extends StatefulWidget {
  const BeginningScreen({super.key});

  @override
  State<BeginningScreen> createState() => _BeginningScreen();
}

class _BeginningScreen extends State<BeginningScreen> {
  SettingsJson _settingsJson = SettingsJson("Первый курс", "41", "x");

  Future<void> readAssetJson() async {
    final String response = await rootBundle.loadString('assets/settings.json');
    final data = await json.decode(response);
    setState(() {
      _settingsJson.course = data["course"];
      _settingsJson.group = data["group"];
      _settingsJson.subgroup = data["subgroup"];
      readJsonGroupsListInit(_settingsJson.course);
      readJsonSubGroupsList(_settingsJson.course, _settingsJson.group);
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
        readJsonGroupsListInit(_settingsJson.course);
        readJsonSubGroupsList(_settingsJson.course, _settingsJson.group);
      });
      return;
    }
    readAssetJson();
    return;
  }

  List itemsGroup = [];

  // Fetch content from the json file
  Future<void> readJsonGroupsListInit(course) async {
    final String response =
        await rootBundle.loadString('assets/groupsList.json');
    final data = await json.decode(response);
    setState(() {
      itemsGroup = data[course];
    });
  }

  Future<void> readJsonGroupsList(course) async {
    final String response =
        await rootBundle.loadString('assets/groupsList.json');
    final data = await json.decode(response);
    setState(() {
      itemsGroup = data[course];
      _settingsJson.group = itemsGroup.first;
      readJsonSubGroupsList(course, _settingsJson.group);
    });
  }

  List itemsSubGroup = [];

  Future<void> readJsonSubGroupsListInit(course, group) async {
    if (course == "Первый курс") {
      final String response =
          await rootBundle.loadString('assets/firstCourse.json');
      final data = await json.decode(response);
      setState(() {
        itemsSubGroup = data[group];
      });
    }
    if (course == "Второй курс") {
      final String response =
          await rootBundle.loadString('assets/secondCourse.json');
      final data = await json.decode(response);
      setState(() {
        itemsSubGroup = data[group];
      });
    }
    if (course == "Третий курс") {
      final String response =
          await rootBundle.loadString('assets/thirdCourse.json');
      final data = await json.decode(response);
      setState(() {
        itemsSubGroup = data[group];
      });
    }
    if (course == "Четвертый курс") {
      final String response =
          await rootBundle.loadString('assets/fourthCourse.json');
      final data = await json.decode(response);
      setState(() {
        itemsSubGroup = data[group];
      });
    }
    if (course == "Пятый курс") {
      final String response =
          await rootBundle.loadString('assets/fifthCourse.json');
      final data = await json.decode(response);
      setState(() {
        itemsSubGroup = data[group];
      });
    }
  }

  Future<void> readJsonSubGroupsList(course, group) async {
    if (course == "Первый курс") {
      final String response =
          await rootBundle.loadString('assets/firstCourse.json');
      final data = await json.decode(response);
      setState(() {
        itemsSubGroup = data[group];
        _settingsJson.subgroup = itemsSubGroup.first;
      });
    }
    if (course == "Второй курс") {
      final String response =
          await rootBundle.loadString('assets/secondCourse.json');
      final data = await json.decode(response);
      setState(() {
        itemsSubGroup = data[group];
        _settingsJson.subgroup = itemsSubGroup.first;
      });
    }
    if (course == "Третий курс") {
      final String response =
          await rootBundle.loadString('assets/thirdCourse.json');
      final data = await json.decode(response);
      setState(() {
        itemsSubGroup = data[group];
        _settingsJson.subgroup = itemsSubGroup.first;
      });
    }
    if (course == "Четвертый курс") {
      final String response =
          await rootBundle.loadString('assets/fourthCourse.json');
      final data = await json.decode(response);
      setState(() {
        itemsSubGroup = data[group];
        _settingsJson.subgroup = itemsSubGroup.first;
      });
    }
    if (course == "Пятый курс") {
      final String response =
          await rootBundle.loadString('assets/fifthCourse.json');
      final data = await json.decode(response);
      setState(() {
        itemsSubGroup = data[group];
        _settingsJson.subgroup = itemsSubGroup.first;
      });
    }
  }

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      readFileSystemJson();
    });
    readJsonGroupsListInit(_settingsJson.course);
    readJsonSubGroupsList(_settingsJson.course, _settingsJson.group);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
              const SizedBox(
                height: 50,
                width: 300,
                child: Center(
                  child: Expanded(
                    child: Text(
                      "Мое расписание занятий",
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 24.0, // text size
                        color: Colors.white, // text color
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 1),
              const SizedBox(
                height: 30,
                width: 300,
                child: Center(
                  child: Expanded(
                    child: Text(
                      "Курс",
                      style: TextStyle(
                        fontSize: 24.0, // text size
                        color: Colors.white, // text color
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Container(
                child: Center(
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      isExpanded: true,
                      hint: Row(
                        children: const [
                          Icon(
                            Icons.arrow_drop_down_sharp,
                            size: 16,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Expanded(
                            child: Text(
                              'Select Item',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w900,
                                color: Colors.black,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      items: itemsCourse
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ))
                          .toList(),
                      value: _settingsJson.course,
                      onChanged: (value) {
                        setState(() {
                          _settingsJson.course = value as String;
                          readJsonGroupsList(value);
                        });
                      },
                      icon: const Icon(
                        Icons.arrow_drop_down,
                      ),
                      iconOnClick: const Icon(Icons.arrow_drop_up),
                      iconSize: 25,
                      iconEnabledColor: Colors.black,
                      iconDisabledColor: Colors.grey,
                      buttonHeight: 50,
                      buttonWidth: 320,
                      buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                      buttonDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.black26,
                        ),
                        color: const Color.fromARGB(255, 252, 252, 252),
                      ),
                      buttonElevation: 2,
                      itemHeight: 40,
                      itemPadding: const EdgeInsets.only(left: 14, right: 14),
                      dropdownMaxHeight: 55,
                      dropdownWidth: 320,
                      dropdownPadding: null,
                      dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                      dropdownElevation: 8,
                      scrollbarRadius: const Radius.circular(40),
                      scrollbarThickness: 6,
                      scrollbarAlwaysShow: true,
                      offset: const Offset(0, 0),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 60),
              const SizedBox(
                height: 30,
                width: 300,
                child: Center(
                  child: Expanded(
                    child: Text(
                      "Группа",
                      style: TextStyle(
                        fontSize: 24.0, // text size
                        color: Colors.white, // text color
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Container(
                child: Center(
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      isExpanded: true,
                      hint: Row(
                        children: const [
                          Icon(
                            Icons.arrow_drop_down_sharp,
                            size: 16,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Expanded(
                            child: Text(
                              'Select Item',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      items: itemsGroup
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ))
                          .toList(),
                      value: _settingsJson.group,
                      onChanged: (value) {
                        setState(() {
                          _settingsJson.group = value as String;
                          readJsonSubGroupsList(_settingsJson.course, value);
                        });
                      },
                      icon: const Icon(
                        Icons.arrow_drop_down,
                      ),
                      iconOnClick: const Icon(Icons.arrow_drop_up),
                      iconSize: 25,
                      iconEnabledColor: Colors.black,
                      iconDisabledColor: Colors.grey,
                      buttonHeight: 50,
                      buttonWidth: 320,
                      buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                      buttonDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.black26,
                        ),
                        color: const Color.fromARGB(255, 252, 252, 252),
                      ),
                      buttonElevation: 2,
                      itemHeight: 40,
                      itemPadding: const EdgeInsets.only(left: 14, right: 14),
                      dropdownMaxHeight: 55,
                      dropdownWidth: 320,
                      dropdownPadding: null,
                      dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                      dropdownElevation: 8,
                      scrollbarRadius: const Radius.circular(40),
                      scrollbarThickness: 6,
                      scrollbarAlwaysShow: true,
                      offset: const Offset(0, 0),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 60),
              Container(
                child: Center(
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      isExpanded: true,
                      hint: Row(
                        children: const [
                          Icon(
                            Icons.arrow_drop_down_sharp,
                            size: 16,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Expanded(
                            child: Text(
                              'Select Item',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      items: itemsSubGroup
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ))
                          .toList(),
                      value: _settingsJson.subgroup,
                      onChanged: (value) {
                        setState(() {
                          _settingsJson.subgroup = value as String;
                        });
                      },
                      icon: const Icon(
                        Icons.arrow_drop_down,
                      ),
                      iconOnClick: const Icon(Icons.arrow_drop_up),
                      iconSize: 25,
                      iconEnabledColor: Colors.black,
                      iconDisabledColor: Colors.grey,
                      buttonHeight: 50,
                      buttonWidth: 320,
                      buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                      buttonDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.black26,
                        ),
                        color: const Color.fromARGB(255, 252, 252, 252),
                      ),
                      buttonElevation: 2,
                      itemHeight: 40,
                      itemPadding: const EdgeInsets.only(left: 14, right: 14),
                      dropdownMaxHeight: 55,
                      dropdownWidth: 320,
                      dropdownPadding: null,
                      dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                      dropdownElevation: 8,
                      scrollbarRadius: const Radius.circular(40),
                      scrollbarThickness: 6,
                      scrollbarAlwaysShow: true,
                      offset: const Offset(0, 0),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 60),
              SizedBox(
                height: 70,
                width: 320,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      textStyle: const TextStyle(fontSize: 20),
                      shape: RoundedRectangleBorder(
                          //to set border radius to button
                          borderRadius: BorderRadius.circular(20)),
                      padding: const EdgeInsets.all(20)),
                  child: const Text('Принять'),
                  onPressed: () {
                    _settingsJson.writeJson();
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainScreen(),
                        ));
                  },
                ),
              ),
            ])),
        backgroundColor: Colors.blue);
  }
}
