import 'package:flutter/material.dart';
import 'package:foodiez/model/restaurants.dart';

class RestaurantList extends StatelessWidget{
  final Restaurants restaurants ;
  List<Restaurant> rl ;
  ResturantData data;
  String imageUrl ;
  RestaurantList({Key key,this.restaurants}):super(key:key);

  @override
  Widget build(BuildContext context) {

      data = restaurants.data;
      rl = data.rstrntList as List<Restaurant>;
      imageUrl = data.imp as String;
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Restaurant List'),
          ),
        body: new GridView.builder(
          padding: new EdgeInsets.all(15.0),
          gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 10.0, mainAxisSpacing: 10.0),
          itemCount: rl.length,
          itemBuilder: (context, index) {
          String url = '${imageUrl}${rl[index].imgString}';
         //   String url = '${imageUrl}7.png';
            return new GestureDetector(
              child: new GridTile(
                  child: Image.network(url,height:
                  20.0, width: 20.0),
                  footer: new Text(rl[index].rstrntName,textAlign: TextAlign
                      .center,textDirection: TextDirection.ltr,style:
                  TextStyle(color: Colors.black,fontStyle: FontStyle.italic,
                              fontSize: 20.0,
                            ),)),
//              onTap: () {
//                Navigator.push(
//                    context,
//                    new MaterialPageRoute(
//                        builder: (context) =>
//                        new PhotoPage(photos[index].url)));
//              },
              );
          },
          ));
  }
}