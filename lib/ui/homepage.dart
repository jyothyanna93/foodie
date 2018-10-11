import 'dart:async';

import 'package:flutter/material.dart';
import 'package:foodiez/services/getlanguagesservice.dart';
import 'package:foodiez/services/getresturanttypeservice.dart';
import 'package:foodiez/util/prefs.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  Future<int> _counter;

  void _incrementCounter() {
    int counter = Prefs.getInt('counter') ?? 0;
    counter = counter + 1;

    //  print(_counter);

    setState(() {
      _counter = Prefs.setInt('counter', counter).then((bool success) {
        return counter;
      });
      print('p $counter');
    });
  }

  @override
  void initState() {
    super.initState();
    Prefs.init();
    getRestaurantsType();
    getLanguages();
    // getRestaurantOffersAndPromotions();

    _counter = Prefs.getIntF('counter');
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      drawer: new Drawer(
        child: ListView(
          padding: new EdgeInsets.all(0.0),
          children: <Widget>[
            new DrawerHeader(
              child: new Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            new ListTile(
              title: new Text('Item 1'),
              onTap: () {},
            ),
            new ListTile(
              title: new Text('Item 2'),
              onTap: () {},
            ),
            new ListTile(
              title: new Text('Item 3'),
              onTap: () {},
            ),
            new ListTile(
              title: new Text('Item 4'),
              onTap: () {},
            )
          ],
        ),
      ),
      body: new Center(
        child: new FutureBuilder<int>(
          future: _counter,
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);

            return snapshot.hasData
                ? new Container(
                    child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Text(
                        'You have pushed the button this many times:',
                      ),
                      new Text(
                        '${snapshot.data}',
                        style: Theme.of(context).textTheme.display1,
                      )
                    ],
                  ))
                : new Container(
                    alignment: AlignmentDirectional.center,
                    child: new CircularProgressIndicator(),
                  );
          },
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
    );
  }

//   _handleSelection(TabController tabController) {
//    switch (tabController.index){
//      case 0:
//        return  MyHomePage();
//      case 1:
//        return  PhotoList();
//      default :
//        MyHomePage();
//    }
//  }
}
