import 'package:flutter/material.dart';

class SignUp extends StatefulWidget{
  @override
  _SignUpState createState() => new _SignUpState();


}
class _SignUpState extends State<SignUp>{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new SafeArea(
            child: new ListView(
                padding: new EdgeInsets.symmetric(horizontal: 24.0),
                children: <Widget>[
                          new SizedBox(height: 80.0,),
                new Column(
                  children: <Widget>[
                  new Image.asset('assets/f.png',color: Colors.white10,
                                    alignment:Alignment.center,),
                  new SizedBox(height: 16.0),
                  new Text('FOODIES'),
                ]),]
        )),
    );
  }




}