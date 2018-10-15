import 'package:flutter/material.dart';
import 'package:foodiez/ui/ftab.dart';
import 'package:foodiez/ui/splashscreen.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.red,
      ),
      home: new SplashScreen(),
      routes: <String, WidgetBuilder>{
        '/main': (BuildContext context) => new FTab()
      },
    );
  }
}
