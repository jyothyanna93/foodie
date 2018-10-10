//part 'rst.g.dart';
//
//@JsonSerializable()
//class RestaurantsS extends Object with _$RestaurantsSSerializermixin{
//  final int code;
//
//  final ResturantDataA data;
//
//  RestaurantsS({this.code,this.data});
//
//  factory RestaurantsS.fromjson(Map<String,dynamic>json){
//
//    return  RestaurantsS(
//        code: json['code'],
//        data: ResturantDataA.fromjson(json['data'])
//        );
//  }
//
//}
//
//
//
//class ResturantDataA {
//  final String imp;
//  final List<RestaurantT> rstrntList;
//  ResturantDataA({this.imp,this.rstrntList});
//
//
//  factory ResturantDataA.fromjson(Map<String,dynamic>json){
//
//    var list = json['r_s'] as List;
//    print(list.runtimeType);
//    List<RestaurantT> restaurantList = list.map((i)=>  RestaurantT
//        .fromjson(i)).toList();
//    print(restaurantList);
//
//    return  ResturantDataA(
//      imp: json['i_m_p'],
//      rstrntList: restaurantList,
//      );
//  }
//
//}
//
//
//class RestaurantT {
//  final int id;
//  final String rstrntName;
//  final int rt;
//  final String category;
//  final int type;
//  final String avrgCost;
//  final String rating;
//  final int status;
//  final String imgString;
//
//  RestaurantT(
//      {this.id,
//        this.rstrntName,
//        this.rt,
//        this.category,
//        this.type,
//        this.avrgCost,
//        this.rating,
//        this.status,
//        this.imgString});
//
//  factory RestaurantT.fromjson(Map<String, dynamic> json) {
//    return new RestaurantT(
//        id: json['id'],
//        rstrntName: json['n_m'],
//        rt: json['r_t'],
//        category: json['category'],
//        type: json['type'],
//        avrgCost: json['avrgCost'],
//        rating: json['rating'],
//        status: json['status'],
//        imgString: json['i_m']
//        );
//  }
//}
//
