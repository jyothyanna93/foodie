import 'dart:async';
import 'dart:convert';
import 'dart:core';

import 'package:flutter/foundation.dart';
import 'package:foodiez/model/resturantofferpromotion.dart';
import 'package:http/http.dart' as http;

Future<OffersAndPromotions> getRestaurantOffersAndPromotions() async {
  String url = 'http://10.168.10.27:81/foodies/api/getrestaurantofferpromotion';

  final response = await http.get(url);

  // print('response.runtimeType ${response.body.runtimeType}');
  if (response.statusCode == 200) {
    return compute(parsedResponse, response.body);
  } else {
    throw new Exception('failed to load ');
  }
}

OffersAndPromotions parsedResponse(String body) {
  // print(body.runtimeType);
  final parsedData = json.decode(body); //.cast<Map<String,dynamic>>();
  // print(parsedData);
  // print('parsedData.runtimeType${parsedData.runtimeType}');

  return OffersAndPromotions.fromJson(parsedData);
}
