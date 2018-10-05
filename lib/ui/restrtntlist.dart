import 'package:flutter/material.dart';
import 'package:foodiez/model/restaurants.dart';
import 'package:foodiez/ui/photopage.dart';

class RestaurantList extends StatelessWidget {
  List<Restaurants> rstrnts;
  String url;

  RestaurantList({Key key, this.rstrnts}) : super(key: key);

//  child: new CircularProgressIndicator()

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
//        appBar: new AppBar(
//          title: new Text('Restaurant List'),
//          ),
//        body:  new ListView.builder(
//
//          itemCount: rstrnts.length,
//          padding: const EdgeInsets.only(
//            left: 15.0,
//            right: 15.0,
//            ),
//          itemBuilder: (context, index) {return new ListTile(
//            leading:new CircleAvatar(child: new Image.network(rstrnts[index].imgString),),
//            title: new Text(rstrnts[index].rstrntName,),
//            contentPadding: const EdgeInsets.all(8.0),
//            onTap: () {
////              Navigator.push(
////                  context,
////                  new MaterialPageRoute(
////                      builder: (context) => new PhotoPage(rstrnts[index].url)));
//            },
//            );
//          }),
     );
  }
}
