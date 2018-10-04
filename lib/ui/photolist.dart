import 'package:flutter/material.dart';
import 'package:foodiez/model/photo.dart';
import 'package:foodiez/ui/photopage.dart';

class PhotoList extends StatelessWidget {
  List<Photo> photos;
  String url;

  PhotoList({Key key, this.photos}) : super(key: key);

//  child: new CircularProgressIndicator()

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Photo List'),
        ),
        body: new GridView.builder(
          padding: new EdgeInsets.all(15.0),
          gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, crossAxisSpacing: 10.0, mainAxisSpacing: 10.0),
          itemBuilder: (context, index) {
            return new GestureDetector(
              child: new GridTile(
                  child: Image.network(photos[index].thumbnailurl,height: 20.0,width: 20.0),
                  footer: new Text('${photos[index].id}',textAlign: TextAlign
                      .center,textDirection: TextDirection.ltr,style:
                  TextStyle(color: Colors.black,fontStyle: FontStyle.italic,
                                fontSize: 20.0,
                            ),)),
              onTap: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) =>
                            new PhotoPage(photos[index].url)));
              },
            );
          },
        ));

    // new ListView.builder(
//
//          itemCount: photos.length,
//          padding: const EdgeInsets.only(
//            left: 15.0,
//            right: 15.0,
//            ),
//          itemBuilder: (context, index) {return new ListTile(
//            leading:new CircleAvatar(child: new Image.network(photos[index]
//                                                                  .thumbnailurl),),
//            title: new Text(photos[index].title,),
//            contentPadding: const EdgeInsets.all(8.0),
//            onTap: () {
//              Navigator.push(
//                  context,
//                  new MaterialPageRoute(
//                      builder: (context) => new PhotoPage(photos[index].url)));
//            },
//            );
//          }),
    // );
  }
}
