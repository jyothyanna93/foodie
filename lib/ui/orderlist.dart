import 'dart:math';

import 'package:flutter/material.dart';
import 'package:foodiez/model/orders.dart';

class OrderList extends StatelessWidget {
  final OrderData orders;
  List<Order> oList;

  OrderList({Key key, this.orders}) : super(key: key);

  List colors = [
    Colors.red,
    Colors.green,
    Colors.yellow,
    Colors.blue,
    Colors.brown,
    Colors.cyan,
    Colors.lime,
    Colors.orange,
    Colors.purple,
    Colors.indigo,
    Colors.pink,
    Colors.teal
  ];
  Random random = new Random();
  int index = 0;

  @override
  Widget build(BuildContext context) {
    oList = orders.data;
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Order List'),
        ),
        body: new Container(
          padding: new EdgeInsets.all(20.0),
          child: new ListView.builder(
              itemCount: oList.length,
              itemBuilder: (context, index) {
                return new ListTile(
                  leading: new CircleAvatar(
                      child: new Text(
                        '${oList[index].restaurantName.substring(0, 1).toUpperCase()}',
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: colors[random.nextInt(10)]),

                  title: new Text(
                    oList[index].restaurantName.toUpperCase(),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  //          onTap: () {
                  //            Navigator.push(
                  //                context,
                  //                new MaterialPageRoute(
                  //                    builder: (context) => new PhotoPage(url:photos[index].url)));
                  //          },
                );
              }),
        ));
  }
}
