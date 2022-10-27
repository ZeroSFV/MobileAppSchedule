import 'package:flutter/material.dart';
import 'mainScreen.dart';

class NavBar extends StatefulWidget {
  final int selectedIndex;
  final String groupNav;
  final String courseNav;
  const NavBar(
      {super.key,
      required this.selectedIndex,
      required this.groupNav,
      required this.courseNav});

  @override
  _NavBar createState() => new _NavBar(selectedIndex);
}

class _NavBar extends State<NavBar> {
  int _selectedIndex;
  _NavBar(this._selectedIndex);

  void _onIconPressed(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0, // in logical pixels
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(color: Color.fromARGB(255, 0, 0, 0)),
      // Row is a horizontal, linear layout.
      child: Row(
        children: [
          Expanded(
              child: IconButton(
                  icon: Icon(Icons.home),
                  color: (_selectedIndex == 1)
                      ? const Color.fromARGB(255, 0, 0, 255)
                      : Color.fromARGB(255, 255, 255, 255),
                  disabledColor: Color.fromARGB(255, 255, 255, 255),
                  tooltip: 'Home page',
                  onPressed: (_selectedIndex == 1)
                      ? () => {
                            _onIconPressed(1),
                          }
                      : () => {
                            _onIconPressed(1),
                            Navigator.pop(context),
                            _sendDataToMainScreen(context),
                          }))
        ],
      ),
    );
  }

  void _sendDataToMainScreen(BuildContext context) {
    String groupToSend = widget.groupNav;
    String courseToSend = widget.courseNav;
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
