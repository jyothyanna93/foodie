import 'package:flutter/material.dart';



class Settings extends StatefulWidget{
  SettingsState createState() => new SettingsState();

}
class SettingsState extends State<Settings>{





  @override
  Widget build(BuildContext context) {

    return new Scaffold(appBar: new AppBar(
        title: new Text('Store'),
        actions : <Widget>[
          new IconButton(icon:new  Icon(Icons.notifications), onPressed:
          null),
          new IconButton(icon:new  Icon(Icons.notifications), onPressed:
          null),
          new IconButton(icon:new  Icon(Icons.notifications), onPressed: null)],
        ),
                        );
  }

}