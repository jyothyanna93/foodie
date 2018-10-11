import 'dart:async';

import 'package:flutter/material.dart';
import 'package:foodiez/model/orders.dart';
import 'package:foodiez/model/photo.dart';
import 'package:foodiez/model/restaurants.dart';
import 'package:foodiez/services/getordersservice.dart';
import 'package:foodiez/services/getresturantservice.dart';
import 'package:foodiez/ui/homepage.dart';
import 'package:foodiez/ui/orderlist.dart';
import 'package:foodiez/ui/photolist.dart';
import 'package:foodiez/ui/restaurantlist.dart';

class FTab extends StatefulWidget {
  @override
  _FTabState createState() => new _FTabState();
}

class _FTabState extends State<FTab> with SingleTickerProviderStateMixin {
  TabController tabController;
  Future<List<Photo>> _responsePhoto;
  Future<Restaurants> _resturants;
  Future<OrderData> _orderData;
  @override
  void initState() {
    super.initState();
    _refresh();
  }

  void _refresh() {
    setState(() {
      _resturants = getRestaurants();
      _orderData = getOrders();
      _responsePhoto = fetchPhotos();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (tabController == null) {
      tabController = new TabController(length: 4, vsync: this);
    }

    return new Scaffold(
        bottomNavigationBar: new Material(
            color: Colors.blue,
            child: new TabBar(
              tabs: <Tab>[
                new Tab(icon: new Icon(Icons.home)),
                new Tab(icon: new Icon(Icons.rss_feed)),
                new Tab(icon: new Icon(Icons.shopping_basket)),
                new Tab(icon: new Icon(Icons.settings)),
              ],
              indicatorColor: Colors.yellow,
              unselectedLabelColor: Colors.black38,
              labelColor: Colors.yellow,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorPadding: EdgeInsets.all(5.0),
              controller: tabController,
            )),
        body: new TabBarView(
          children: <Widget>[
            new MyHomePage(
                title: 'Flutter '
                    'Demo'),
            new FutureBuilder(
                future: _responsePhoto,
                builder: (BuildContext context,
                    AsyncSnapshot<List<Photo>> snapshot) {
                  if (snapshot.hasError) print(snapshot.error);
                  return snapshot.hasData
                      ? new PhotoList(photos: snapshot.data)
                      : new Container(
                          alignment: AlignmentDirectional.center,
                        );
                }),
            new FutureBuilder(
                future: _orderData,
                builder: (context, snapshot) {
                  if (snapshot.hasError) print(snapshot.error);
                  return snapshot.hasData
                      ? new OrderList(orders: snapshot.data)
                      : new Container(
                          alignment: AlignmentDirectional.center,
                        );
                }),
            new FutureBuilder(
              future: _resturants,
              builder: (context, snapshot) {
                print(snapshot);
                if (snapshot.hasError) print(snapshot.error);
                print('snapshot.hasData${snapshot.data}');
                return snapshot.hasData
                    ? new RestaurantList(
                        restaurants: snapshot.data,
                      )
                    : new Container(
                        alignment: AlignmentDirectional.center,
                        child: new Text('list'),
                      );
              },
            )
          ],
          controller: tabController,
        ));
  }
}
