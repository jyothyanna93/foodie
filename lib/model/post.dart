import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'package:http/http.dart' as http;



Future<List<Post>>fetchPost() async{
  final response = await http.get('https://jsonplaceholder.typicode.com/posts');

  if (response.statusCode == 200){

    return parsePost(response.body);

  }
  else{
    throw new Exception('failed to load post');

  }

}
List<Post>parsePost(String responsebody){
  final parsed = json.decode(responsebody).cast<Map<String,dynamic>>();
  return parsed.map<Post>((json) => new Post.fromJson(json)).toList();

}

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({this.userId,this.id,this.title,this.body});


  factory Post.fromJson(Map<String,dynamic> json){

    return new Post(
      userId: json['userId'],
      id:json['id'],
      title:json['title'],
      body:json['body'],
      );
  }


}



