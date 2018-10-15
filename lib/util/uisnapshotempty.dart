import 'package:flutter/material.dart';

class UINoResponse extends StatelessWidget {
  final String title;
  UINoResponse({this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text(title),
      ),
      body: Center(child: Text('Something went Wromg')),
    );
  }
}
