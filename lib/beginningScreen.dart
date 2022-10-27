import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'mainScreen.dart';

final List<String> itemsGroup = [
  '11',
  '12',
  '13',
  '15',
  '21',
  '23',
  '24',
  '25',
  '27',
  '28',
  '30',
  '31',
  '33',
  '34',
  '35',
  '36',
  '38',
  '41',
  '42',
  '43',
  '44',
  '45',
  '47',
  '48',
  '53',
];
String? selectedValueGroup;

final List<String> itemsCourse = [
  'Первый курс',
  'Второй курс',
  'Третий курс',
  'Четвертый курс',
];
String? selectedValueCouse;

class BeginningScreen extends StatefulWidget {
  const BeginningScreen({super.key});

  @override
  State<BeginningScreen> createState() => _BeginningScreen();
}

class _BeginningScreen extends State<BeginningScreen> {
  String selectedValueGroup = itemsGroup.first;
  String selectedValueCourse = itemsCourse.first;
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
                        fontSize: 24.0, // text size
                        color: Colors.white, // text color
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
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
                      value: selectedValueCourse,
                      onChanged: (value) {
                        setState(() {
                          selectedValueCourse = value as String;
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
                        color: Color.fromARGB(255, 252, 252, 252),
                      ),
                      buttonElevation: 2,
                      itemHeight: 40,
                      itemPadding: const EdgeInsets.only(left: 14, right: 14),
                      dropdownMaxHeight: 85,
                      dropdownWidth: 320,
                      dropdownPadding: null,
                      dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromARGB(255, 255, 255, 255),
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
              const SizedBox(height: 90),
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
                      value: selectedValueGroup,
                      onChanged: (value) {
                        setState(() {
                          selectedValueGroup = value as String;
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
                        color: Color.fromARGB(255, 252, 252, 252),
                      ),
                      buttonElevation: 2,
                      itemHeight: 40,
                      itemPadding: const EdgeInsets.only(left: 14, right: 14),
                      dropdownMaxHeight: 85,
                      dropdownWidth: 320,
                      dropdownPadding: null,
                      dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromARGB(255, 255, 255, 255),
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
              const SizedBox(height: 100),
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
                      padding: EdgeInsets.all(20)),
                  child: const Text('Принять'),
                  onPressed: () {
                    Navigator.pop(context);
                    _sendDataToMainScreen(context);
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => const MainScreen()),
                    // );
                  },
                ),
              ),
            ])),
        backgroundColor: Colors.blue);
  }

  void _sendDataToMainScreen(BuildContext context) {
    String groupToSend = selectedValueGroup;
    String courseToSend = selectedValueCourse;
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MainScreen(
            group: groupToSend,
            course: courseToSend,
          ),
        ));
  }
}
