import 'dart:async';

import 'package:flutter/material.dart';




class SplashScreen extends StatefulWidget{
  @override
  _SplashScreenState createState() => new _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen>{

  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationPage);
  }
  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/main');
  }

  @override
  void initState() {

    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {



    return  new Scaffold(

        body:  new Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[

            new Image.asset('assets/f.jpg'),],
          )


        );

  }

}