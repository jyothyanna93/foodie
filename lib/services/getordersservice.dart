import 'dart:async';
import 'dart:convert';
import 'dart:core';

import 'package:flutter/foundation.dart';
import 'package:foodiez/model/orders.dart';
import 'package:http/http.dart' as http;

Future<OrderData> getOrders() async {
  String url = 'http://10.168.10.27:81/foodies/api/getorder';
  Map bodyMap = {'user_id': '1'};
  final response = await http.post(
    url,
    body: bodyMap,
  );

  // print('response.runtimeType ${response}');
  if (response.statusCode == 200) {
    return compute(parsedResponse, response.body);
  } else {
    throw new Exception('failed to load ');
  }
}

OrderData parsedResponse(String body) {
//  print(body);
  final parsedData = json.decode(body);
  // print(parsedData);
  //print('parsedData.runtimeType${parsedData.runtimeType}');
  return OrderData.fromjson(parsedData);
}
