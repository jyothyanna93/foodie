import 'dart:async';
import 'dart:convert';
import 'dart:core';

import 'package:flutter/foundation.dart';
import 'package:foodiez/model/language.dart';
import 'package:http/http.dart' as http;

Future<LanguageData> getLanguages() async {
  String url = 'http://10.168.10.27:81/foodies/api/getLanguages';
  final response = await http.get(url);

  print('response.runtimeType ${response}');
  if (response.statusCode == 200) {
    return compute(parsedResponse, response.body);
  } else {
    throw new Exception('failed to load ');
  }
}

LanguageData parsedResponse(String body) {
  print(body);
  final parsedData = json.decode(body);
  print(parsedData);
  print('parsedData.runtimeType${parsedData.runtimeType}');
  return LanguageData.fromjson(parsedData);
}
