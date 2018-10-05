import 'dart:async';
import 'dart:core';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;


Future<List<Restaurants>> getRestaurants()async{
  String url = 'http://http://10.168.10.27:81/foodies/api/getRestaurants';
  final response = await http.get('http://10.168.10.27:81/foodies/api/getRestaurants');

print(response);

  if (response.statusCode == 200){

//    print(response);
//    print(response.body);

  return parsedResponse(response.body);
  }
  else{
    print(response.body);
    throw new Exception('failed to load ');
  }
}



List<Restaurants> parsedResponse(String body) {
  final pearsedData = json.decode(body);//.cast<Map<String,dynamic>>();
  return pearsedData.map<Restaurants>((json) => new Restaurants.fromjson(json))
      .toList();

}


class Restaurants{
  final int code;
  final String imp;
  List<RestaurantsData> data;

  Restaurants({this.code,this.imp,this.data});

  factory Restaurants.fromjson(Map<String,dynamic>json){
    return new Restaurants(
      code: json['code'],
      imp: json['i_m_p'],
      data: json['data'] .map((value) => new RestaurantsData.fromjson
      (value)).toList()
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
