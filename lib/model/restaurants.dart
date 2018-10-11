import 'package:json_annotation/json_annotation.dart';

part 'restaurants.g.dart';

@JsonSerializable()
class Restaurants extends Object {
  final int code;

  final ResturantData data;

  Restaurants({this.code, this.data});

  factory Restaurants.fromJson(Map<String, dynamic> json) =>
      _$RestaurantsFromJson(json);
}

@JsonSerializable()
class ResturantData extends Object {
  final String i_m_p; // imageUrl
  final List<Restaurant> r_s; // resturantList
  ResturantData({this.i_m_p, this.r_s});

  factory ResturantData.fromJson(Map<String, dynamic> json) =>
      _$ResturantDataFromJson(json);
}

@JsonSerializable()
class Restaurant extends Object {
  final int id;
  final String n_m; //rstrntName;
  final int r_t; //rt;
  final String category; //category;
  final int type; //type;
  final String rating; //rating;
  final String a_c; //avrgCost;
  final int status; //status;
  final String i_m; //imgString;

  Restaurant(
      {this.id,
      this.n_m,
      this.r_t,
      this.category,
      this.type,
      this.rating,
      this.a_c,
      this.status,
      this.i_m});
  factory Restaurant.fromJson(Map<String, dynamic> json) =>
      _$RestaurantFromJson(json);
}
