import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mystore/listdata.dart';
import 'package:mystore/loginform.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //Colour Themes
  int colorline1 = 0xffec4a79;
  int colorline2 = 0xff3a8ac5;
  int colorline3 = 0xff68396d;
  int colorline4 = 0xff2baa7f;

  //THIS IS SPLASH SCREEN
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => LoginForm(),
      ));
    });
  }

  // added test yourself
  // and made the text to align at center
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage("images/splash.png")),
            SizedBox(height: 20,),
            Text(
              "Inventory Product App",
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black,
                fontFamily: "Netflix",
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              "© Muhamad Ikhsan & Fathur Rahman",
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.black,
                fontFamily: "Netflix",
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
