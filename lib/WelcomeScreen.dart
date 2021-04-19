import 'package:flutter/material.dart';
import 'package:wireless_social_dist/CommonScreen.dart';
import 'package:wireless_social_dist/constants.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = "WelcomeScreen";
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Smart Social Distancing Device',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'ECE 3040',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Image.asset(
                'wireless_images/wireless_image.png',
                scale: 1,
              ),
              MaterialButton(
                color: Colors.black,
                child: Text(
                  "Tap to proceed >>>",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
                highlightColor: kPinkColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                onPressed: () {
                  Navigator.pushNamed(context, CommonScreen.id);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
