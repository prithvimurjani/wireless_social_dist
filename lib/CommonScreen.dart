import 'package:flutter/material.dart';

class CommonScreen extends StatefulWidget {
  static const String id = "CommonScreen";
  @override
  _CommonScreenState createState() => _CommonScreenState();
}

class _CommonScreenState extends State<CommonScreen> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final _pageOptions = [];
    return MaterialApp(
      color: Colors.black,
      home: SafeArea(
          child: Scaffold(
        backgroundColor: Colors.black,
        body: _pageOptions[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("Home"),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                (Icons.dashboard),
              ),
              title: Text("Dashboard"),
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blueAccent,
          backgroundColor: Colors.black,
          unselectedItemColor: Colors.white,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      )),
    );
  }
}
