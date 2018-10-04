import 'package:flutter/material.dart';
class PhotoPage extends StatefulWidget{
  String url;
  PhotoPage(this.url);
  @override
   PhotoPageState createState() => new PhotoPageState(url);
}

class PhotoPageState extends State<PhotoPage> {
  String url;

  PhotoPageState(this.url);
  @override
  void initState() {
    super.initState();
    setState(() {

    });

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Photo'),),
      body: new Center(
        child: new Container(padding: new EdgeInsets.all(20.0),child: Image
            .network(url),),
        ),);
  }
}
