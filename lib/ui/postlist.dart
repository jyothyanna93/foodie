
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'package:foodiez/model/post.dart';



class PostList extends StatelessWidget {
  List<Post> posts;
  String url;
  PostList({Key key, this.posts}) : super(key: key);
  List colors = [Colors.red, Colors.green, Colors.yellow,Colors.blue,Colors
      .brown,Colors.cyan,Colors.lime,Colors.orange,Colors.purple,Colors
      .indigo,Colors.pink,Colors.teal];
  Random random = new Random();
  int index = 0;



  @override
  Widget build(BuildContext context) {

    return new Scaffold(
        appBar: new AppBar( title: new Text('Post List'),),
        body: new ListView.builder(
        itemCount: posts.length,
        padding: const EdgeInsets.only(
          left: 15.0,
          right: 15.0,
          ),
        itemBuilder: (context, index) {return new ListTile(
          leading: new CircleAvatar(child: new  Text('${posts[index].id}'),
                                      backgroundColor: colors[random.nextInt
                                        (10)]),

          title: new Text(posts[index].title,),
//          onTap: () {
//            Navigator.push(
//                context,
//                new MaterialPageRoute(
//                    builder: (context) => new PhotoPage(url:photos[index].url)));
//          },
          );
        }));
  }
}
