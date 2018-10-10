class RestaurantType {
  final int code;

  final TypeData data;

  RestaurantType({this.code, this.data});

  factory RestaurantType.fromjson(Map<String, dynamic> json) {
    return RestaurantType(
        code: json['code'], data: TypeData.fromjson(json['data']));
  }
}

class TypeData {
  final String imp;
  final List<Type> rTypeList;
  TypeData({this.imp, this.rTypeList});

  factory TypeData.fromjson(Map<String, dynamic> json) {
    var list = json['r_t_s'] as List;
    // print(list.runtimeType);
    List<Type> rTypeList = list.map((i) => Type.fromjson(i)).toList();
    //print(rTypeList);

    return TypeData(
      imp: json['i_m_p'],
      rTypeList: rTypeList,
    );
  }
}

class Type {
  final int id;
  final String menuName;
  final String imgString;

  Type({this.id, this.menuName, this.imgString});

  factory Type.fromjson(Map<String, dynamic> json) {
    return new Type(
        id: json['id'], menuName: json['mn'], imgString: json['im']);
  }
}
