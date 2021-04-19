import 'package:flutter/material.dart';
import 'package:wireless_social_dist/News.dart';
import 'package:wireless_social_dist/SensorData.dart';
import 'package:wireless_social_dist/constants.dart';

class CommonScreen extends StatefulWidget {
  static const String id = "CommonScreen";
  @override
  _CommonScreenState createState() => _CommonScreenState();
}

class _CommonScreenState extends State<CommonScreen> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final _pageOptions = [
      SensorData(),
      News(),
    ];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      home: SafeArea(
          child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text(
            'Smart Social Distancer',
          ),
          actions: [],
        ),
        backgroundColor: Colors.white,
        body: _pageOptions[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.directions_walk),
              title: Text("Active distancing"),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                (Icons.dashboard),
              ),
              title: Text("News"),
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: kPinkColor,
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
