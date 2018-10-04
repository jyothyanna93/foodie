import 'package:flutter/material.dart';
import 'package:foodiez/model/post.dart';
import 'package:foodiez/ui/photolist.dart';
import 'package:foodiez/model/photo.dart';
import 'package:foodiez/ui/homepage.dart';
import 'package:foodiez/ui/postlist.dart';
import 'package:foodiez/ui/settings.dart';



class FTab extends StatefulWidget{

  @override
  _FTabState createState() => new  _FTabState();
}

class _FTabState extends State<FTab> with SingleTickerProviderStateMixin{

  TabController tabController;
  @override
  Widget build(BuildContext context) {
    if(tabController == null) {
      tabController= new TabController(length: 4, vsync: this);
    }

    return new Scaffold(
        bottomNavigationBar: new Material(
        color: Colors.blue,
        child: new TabBar(
        tabs: <Tab>[
        new Tab(icon: new Icon(Icons.home)),
        new  Tab(icon: new Icon(Icons.rss_feed)),
        new  Tab(icon: new Icon(Icons.perm_identity)),
        new Tab(icon: new Icon(Icons.settings)),],
        indicatorColor: Colors.yellow,
        unselectedLabelColor: Colors.black38,
        labelColor: Colors.yellow,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorPadding: EdgeInsets.all(5.0),
        controller: tabController,)

    ),
         body: new TabBarView(
         children: <Widget>[new MyHomePage(title: 'Flutter '
             'Demo'),new FutureBuilder<List<Photo>>(
                      future: fetchPhotos(),
                      builder: (context,snapshot){
                        if (snapshot.hasError)print(snapshot.error);
                        return snapshot.hasData
                            ?new PhotoList(photos: snapshot.data):
                            new Container(
                              alignment: AlignmentDirectional.center,

                              );
                       }
                      ),
              new FutureBuilder(future: fetchPost(),builder: (context,
             snapshot){
                if (snapshot.hasError)print(snapshot.error);
                return snapshot.hasData
                    ?new PostList(posts: snapshot.data):
                new Container(
                  alignment: AlignmentDirectional.center,

                  );

         }),new Settings()
                    ],
           controller: tabController,
                )

        );

  }



}