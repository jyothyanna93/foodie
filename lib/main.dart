import 'dart:async';

import 'package:flutter/material.dart';
import 'prefs.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(

        primarySwatch: Colors.blue,
        ),
      home: new SplashScreen(),
      routes: <String, WidgetBuilder>{
        '/main': (BuildContext context) => new MyHomePage(title: 'Flutter '
            'Demo')},
      );
  }
}

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

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);



  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {//
// Future<SharedPreferences> _pref =  SharedPreferences.getInstance();

  Future<int> _counter;

  TabController tabController;
  void _incrementCounter() {

    int counter = Prefs.getInt('counter') ?? 0;
    counter = counter + 1;

    print(_counter);

    setState(() {

      _counter = Prefs.setInt('counter', counter).then((bool success){
        return counter;
      });
      print('p ${counter}');
    });
  }

  @override
  void initState() {
    super.initState();
    Prefs.init();

    tabController = new TabController(length: 4, vsync: this);
    _counter = Prefs.getIntF('counter');

  }
  @override
  void dispose() {
    Prefs.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(

        title: new Text(widget.title),
        ),
      body: new Center(
          child:new FutureBuilder<int>(
            future: _counter,
            builder:(context, snapshot){

              if (snapshot.hasError) print(snapshot.error);



              return snapshot.hasData
                  ? new  Container(child:new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[ new Text(
                  'You have pushed the button this many times:',
                  ),
                new Text('${snapshot.data}',
                           style: Theme.of(context).textTheme.display1,
                         )
                ],
                ))
                  : new Container(
                alignment: AlignmentDirectional.center,
                child: new CircularProgressIndicator(),);


            },
            )

          ),

      bottomNavigationBar: new Material(
          color: Colors.blue,
          child: new TabBar(
              tabs: <Tab>[
        new Tab(
            icon: new Icon(
                Icons.home)),
        new  Tab(
            icon: new Icon(
                Icons.rss_feed)),
        new  Tab(
            icon: new Icon(
                Icons.perm_identity)),
        new Tab(
            icon: new Icon(Icons.settings)),
      ],
              indicatorColor: Colors.yellow,
              unselectedLabelColor: Colors.black38,
              labelColor: Colors.yellow,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorPadding: EdgeInsets.all(5.0),
              controller: tabController)

                                                   ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip:'Increment',
        child: new Icon(Icons.add),
        ),


      );
  }
}
