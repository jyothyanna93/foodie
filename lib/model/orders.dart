import 'package:json_annotation/json_annotation.dart';

part 'orders.g.dart';

@JsonSerializable()
class OrderData {
  final int code;
  final List<Order> data;
  OrderData({this.code, this.data});

  factory OrderData.fromJson(Map<String, dynamic> json) =>
      _$OrderDataFromJson(json);
}

@JsonSerializable()
class Order {
  final int id; //id;
  final int o_i; //ownerId;
  final String name; //restaurantName;
  final int l_i; //languageId;
  final String f_n; //firstname;
  final String l_c; //languageCode;
  final int o_s; //orderStatus;
  final String p_p; //productPrice;
  final String e_t; //extrThings;
  final String p_s; //paymentStatus;
  final String o_i_s; //orderItemStatus;

  Order(
      {this.id,
      this.o_i,
      this.name,
      this.l_i,
      this.f_n,
      this.l_c,
      this.o_s,
      this.p_p,
      this.e_t,
      this.p_s,
      this.o_i_s});

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}
