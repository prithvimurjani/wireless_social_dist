import 'package:flutter/material.dart';
import 'package:wireless_social_dist/CommonScreen.dart';
import 'package:wireless_social_dist/News.dart';
import 'package:wireless_social_dist/SensorData.dart';
import 'package:wireless_social_dist/WelcomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //theme: ThemeData.dark(),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        CommonScreen.id: (context) => CommonScreen(),
        SensorData.id: (context) => SensorData(),
        News.id: (context) => News(),
      },
    );
  }
}
