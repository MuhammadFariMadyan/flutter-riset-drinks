import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:drinks_flutter_before/src/ui/home/home_screen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) {
            return HomeScreen();
          },
        ),
      );
    });
    return SafeArea(
      child: Scaffold(
        body: new Center(
            child: Column(
              children: <Widget>[
                new Padding(padding: new EdgeInsets.all(5.0)),
                Image.asset(
                  'assets/images/img_logo_web.png',
                  height: 400.0,
                  width: 900.0,
                ),
                new Padding(padding: new EdgeInsets.all(3.0)),
                buildCircularProgressIndicator()
              ],
            )),
      ),
    );
  }

  Widget buildCircularProgressIndicator() {
    if (Platform.isIOS) {
      return CupertinoActivityIndicator();
    } else {
      return CircularProgressIndicator();
    }
  }
}
