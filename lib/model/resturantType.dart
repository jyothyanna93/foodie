import 'package:json_annotation/json_annotation.dart';

part 'resturantType.g.dart';

@JsonSerializable()
class RestaurantType {
  final int code;

  final TypeData data;

  RestaurantType({this.code, this.data});

  factory RestaurantType.fromJson(Map<String, dynamic> json) =>
      _$RestaurantTypeFromJson(json);
}

@JsonSerializable()
class TypeData {
  final String i_m_p;
  final List<Type> rTypeList;
  TypeData({this.i_m_p, this.rTypeList});

  factory TypeData.fromJson(Map<String, dynamic> json) =>
      _$TypeDataFromJson(json);
}

@JsonSerializable()
class Type {
  final int id;
  final String mn; //menuName
  final String im; //ImgeString

  Type({this.id, this.mn, this.im});

  factory Type.fromJson(Map<String, dynamic> json) => _$TypeFromJson(json);
}
