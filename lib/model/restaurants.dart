class Restaurants {
  final int code;

  final ResturantData data;

  Restaurants({this.code, this.data});

  factory Restaurants.fromjson(Map<String, dynamic> json) {
    return Restaurants(
        code: json['code'], data: ResturantData.fromjson(json['data']));
  }
}

class ResturantData {
  final String imp;
  final List<Restaurant> rstrntList;
  ResturantData({this.imp, this.rstrntList});

  factory ResturantData.fromjson(Map<String, dynamic> json) {
    var list = json['r_s'] as List;
    //  print(list.runtimeType);
    List<Restaurant> restaurantList =
        list.map((i) => Restaurant.fromjson(i)).toList();
    //  print(restaurantList);

    return ResturantData(
      imp: json['i_m_p'],
      rstrntList: restaurantList,
    );
  }
}

class Restaurant {
  final int id;
  final String rstrntName;
  final int rt;
  final String category;
  final int type;
  final String avrgCost;
  final String rating;
  final int status;
  final String imgString;

  Restaurant(
      {this.id,
      this.rstrntName,
      this.rt,
      this.category,
      this.type,
      this.avrgCost,
      this.rating,
      this.status,
      this.imgString});

  factory Restaurant.fromjson(Map<String, dynamic> json) {
    return new Restaurant(
        id: json['id'],
        rstrntName: json['n_m'],
        rt: json['r_t'],
        category: json['category'],
        type: json['type'],
        avrgCost: json['avrgCost'],
        rating: json['rating'],
        status: json['status'],
        imgString: json['i_m']);
  }
}
