import 'dart:async';
import 'dart:convert';
import 'dart:core';

import 'package:http/http.dart'as http;
import 'package:flutter/foundation.dart';

Future<List<Photo>> fetchPhotos() async{
  final response = await http.get('https://jsonplaceholder.typicode.com/photos');
  if(response.statusCode == 200){
    print(response.body.length);
    return compute(parsedResponse,response.body);
  }else{
    throw new Exception('failed to load ');
  }
}

List<Photo> parsedResponse(String body) {
  final pearsedData = json.decode(body).cast<Map<String,dynamic>>();
  return pearsedData.map<Photo>((json) => new Photo.fromjson(json)).toList();

}

class Photo{
  int id;
  String title;
  String thumbnailurl;
  String url ;
  Photo({ this.id,this.title,this.thumbnailurl,this.url});
  factory Photo.fromjson(Map<String,dynamic> json ){

    return new Photo(
      id: json['id'],
      title: json['title'],
      thumbnailurl: json['thumbnailUrl'],
      url:json['url']
    );

  }
}