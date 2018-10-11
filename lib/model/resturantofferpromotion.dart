import 'package:json_annotation/json_annotation.dart';

part 'resturantofferpromotion.g.dart';

@JsonSerializable()
class OffersAndPromotions {
  final int code;

  final OfferData data;

  OffersAndPromotions({this.code, this.data});

  factory OffersAndPromotions.fromJson(Map<String, dynamic> json) =>
      _$OffersAndPromotionsFromJson(json);
}

@JsonSerializable()
class OfferData {
  final String i_m_p; //imp imageURL;
  final List<Offer> o_p;
  OfferData({this.i_m_p, this.o_p});

  factory OfferData.fromJson(Map<String, dynamic> json) =>
      _$OfferDataFromJson(json);
}

@JsonSerializable()
class Offer {
  final int id; //id
  final int o_i; //ownerId;
  final String n_m; //rstrtName;
  final String p_t_f; //ofrTimeFrom;
  final String p_t_t; //ofrTimeTo;
  final String p_c; //ofrCode;
  final int h_p_v; // hmePageView;
  final int status; //status;
  final String i_m; //imgString;

  Offer(
      {this.id,
      this.o_i,
      this.n_m,
      this.p_t_f,
      this.p_t_t,
      this.p_c,
      this.h_p_v,
      this.status,
      this.i_m});

  factory Offer.fromJson(Map<String, dynamic> json) => _$OfferFromJson(json);
}
