import 'dart:async';
import 'dart:core';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;


Future<List<Restaurants>> getRestaurants()async{
  String url = 'http://http://10.168.10.27:81/foodies/api/getRestaurants';
  final response = await http.get('http://10.168.10.27:81/foodies/api/getRestaurants');


  print('response.runtimeType ${response.body.runtimeType}');
  if (response.statusCode == 200){
  return parsedResponse(response.body);
  }
  else{
      throw new Exception('failed to load ');
  }
}



List<Restaurants> parsedResponse(String body) {
  print(body.runtimeType);
  final parsedData = json.decode(body).cast<Map<String,dynamic>>();
  print('parsedData.runtimeType${parsedData.runtimeType}');

  return parsedData.map<Restaurants>((json) => Restaurants.fromjson(json)).toList();

}


class Restaurants{
  final int code;
  final String imp;
  final List<RestaurantsData> data;

  Restaurants({this.code,this.imp,this.data});

  factory Restaurants.fromjson(Map<String,dynamic>json){

    var list = json['data'] as List;
    print(list.runtimeType);
    final List<RestaurantsData> data = list.map((i)=>RestaurantsData.fromjson
      (i)).toList();

    return new Restaurants(
      code: json['code'],
      imp: json['i_m_p'],
      data: (json['data'] as List).map((i)=> new RestaurantsData.fromjson
      (i)).toList(),

    );
  }

}

class RestaurantsData {
  final int id;
  final String rstrntName;
  final String category;
  final int type;
  final double avrgCost;
  final String rating;
  final int status;
  final String imgString;

  RestaurantsData(
      {this.id,
      this.rstrntName,
      this.category,
      this.type,
      this.avrgCost,
      this.rating,
      this.status,
      this.imgString});

  factory RestaurantsData.fromjson(Map<String, dynamic> json) {
    return new RestaurantsData(
        id: json['id'],
        rstrntName: json['rstrntName'],
        category: json['category'],
        type: json['type'],
        avrgCost: json['avrgCost'],
        rating: json['rating'],
        status: json['status'],
        imgString: json['imgString']
        );
  }
}
