import 'dart:async';
import 'dart:core';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;


Future <Restaurants> getRestaurants()async{
  String url = 'http://10.168.10.27:81/foodies/api/getRestaurants';
  final response = await http.get(url);


  print('response.runtimeType ${response.body.runtimeType}');
  if (response.statusCode == 200){
  return parsedResponse(response.body);
  }
  else{
      throw new Exception('failed to load ');
  }
}



Restaurants parsedResponse(String body) {
  print(body.runtimeType);
  final parsedData = json.decode(body);//.cast<Map<String,dynamic>>();
  print(parsedData);
  print('parsedData.runtimeType${parsedData.runtimeType}');
//  Restaurants rstrnts = new Restaurants.fromjson(parsedData);
//  print(rstrnts.data);
  return Restaurants.fromjson(parsedData);

}


class Restaurants{
  final int code;

 final ResturantData data;

  Restaurants({this.code,this.data});

  factory Restaurants.fromjson(Map<String,dynamic>json){

    return  Restaurants(
      code: json['code'],
      data: ResturantData.fromjson(json['data'])
    );
  }

}


class ResturantData {
  final String imp;
  final List<Restaurant> rstrntList;
  ResturantData({this.imp,this.rstrntList});


  factory ResturantData.fromjson(Map<String,dynamic>json){

    var list = json['r_s'] as List;
    print(list.runtimeType);
    List<Restaurant> restaurantList = list.map((i)=>  Restaurant
        .fromjson(i)).toList();
    print(restaurantList);

    return  ResturantData(
      imp: json['i_m_p'],
      rstrntList: restaurantList,
      );
  }

}


class Restaurant {
  final int id;
  final String rstrntName;
  final int rt;
  final String category;
  final int type;
  final String avrgCost;
  final String rating;
  final int status;
  final String imgString;

  Restaurant(
      {this.id,
      this.rstrntName,
      this.rt,
      this.category,
      this.type,
      this.avrgCost,
      this.rating,
      this.status,
      this.imgString});

  factory Restaurant.fromjson(Map<String, dynamic> json) {
    return new Restaurant(
        id: json['id'],
        rstrntName: json['n_m'],
        rt: json['r_t'],
        category: json['category'],
        type: json['type'],
        avrgCost: json['avrgCost'],
        rating: json['rating'],
        status: json['status'],
        imgString: json['i_m']
        );
  }
}

