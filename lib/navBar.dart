import 'package:flutter/material.dart';
import 'mainScreen.dart';

class NavBar extends StatefulWidget {
  final int selectedIndex;
  const NavBar({super.key, required this.selectedIndex});

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
      decoration: const BoxDecoration(color: Color.fromARGB(255, 0, 0, 0)),
      // Row is a horizontal, linear layout.
      child: Row(
        children: [
          Expanded(
              child: IconButton(
                  icon: const Icon(Icons.home),
                  color: (_selectedIndex == 1)
                      ? const Color.fromARGB(255, 0, 0, 255)
                      : const Color.fromARGB(255, 255, 255, 255),
                  disabledColor: const Color.fromARGB(255, 255, 255, 255),
                  tooltip: 'Home page',
                  onPressed: (_selectedIndex == 1)
                      ? () => {
                            _onIconPressed(1),
                          }
                      : (_selectedIndex == 0)
                          ? () => {
                                _onIconPressed(1),
                                Navigator.pop(context),
                                _sendDataToMainScreen(context),
                              }
                          : () => {
                                _onIconPressed(1),
                                Navigator.pop(context),
                                Navigator.pop(context),
                                //_sendDataToMainScreen(context),
                              }))
        ],
      ),
    );
  }

  void _sendDataToMainScreen(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MainScreen(),
        ));
  }
}
