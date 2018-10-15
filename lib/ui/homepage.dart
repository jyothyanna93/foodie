import 'dart:async';

import 'package:flutter/material.dart';
import 'package:foodiez/model/resturantofferpromotion.dart';
import 'package:foodiez/services/getlanguagesservice.dart';
import 'package:foodiez/services/getofferspromotionservice.dart';
import 'package:foodiez/services/getresturanttypeservice.dart';
import 'package:foodiez/util/imgecarousel.dart';
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
  Future<OffersAndPromotions> _offerPromotion;

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
    _offerPromotion = getRestaurantOffersAndPromotions();

    _counter = Prefs.getIntF('counter');
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _iCarousel() {
    return FutureBuilder(
        future: _offerPromotion,
        builder: (contex, snapshot) {
          if (snapshot.hasError) {
            return new Container(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                alignment: AlignmentDirectional.center,
                child: new Text('Some error occured'));
          } else {
            if (snapshot.hasData) {
              final OffersAndPromotions offers = snapshot.data;
              final OfferData offerData = offers.data;
              final List<Offer> offerList = offerData.o_p;
              final String imgString = offerData.i_m_p;
              //String imageUrl = '${imgString}${offerList[index].}';
              return new ImageCarousel(
                <ImageProvider>[
                  NetworkImage('${imgString}${offerList[0].i_m}'),
                  NetworkImage('${imgString}${offerList[1].i_m}'),
                  NetworkImage('${imgString}${offerList[2].i_m}'),
                ],
                interval: Duration(seconds: 2),
                fit: BoxFit.fitWidth,
              );
            } else {
              return new Container(
                child: Center(child: new CircularProgressIndicator()),
                alignment: AlignmentDirectional.center,
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
              );
            }
          }
        });
  }

  Widget _counterWidget() {
    return new FutureBuilder<int>(
      future: _counter,
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);

        return snapshot.hasData
            ? Container(
                color: Colors.yellow,
                width: MediaQuery.of(context).size.width,
                child: Center(
                    child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Text(
                      'You have pushed the button this many times:',
                    ),
                    new Text(
                      '${snapshot.data}',
                      style: Theme.of(context).textTheme.display1,
                    )
                  ],
                )))
            : new Container(
                alignment: AlignmentDirectional.center,
                child: new CircularProgressIndicator(),
              );
      },
    );
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
      body: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          _iCarousel(),
          _counterWidget(),
        ],
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
