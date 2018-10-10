class OrderData {
  final int code;
  final List<Order> data;
  OrderData({this.code, this.data});

  factory OrderData.fromjson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    List<Order> orderList = list.map((i) => Order.fromjson(i)).toList();

//    print(orderList);

    return OrderData(
      code: json['code'],
      data: orderList,
    );
  }
}

class Order {
  final int id;
  final int ownerId;
  final String restaurantName;
  final int languageId;
  final String firstname;
  final String languageCode;
  final int orderStatus;
  final String productPrice;
  final String extrThings;
  final String paymentStatus;
  final String orderItemStatus;

  Order(
      {this.id,
      this.ownerId,
      this.restaurantName,
      this.languageId,
      this.firstname,
      this.languageCode,
      this.orderStatus,
      this.productPrice,
      this.extrThings,
      this.paymentStatus,
      this.orderItemStatus});

  factory Order.fromjson(Map<String, dynamic> json) {
    return new Order(
        id: json['id'],
        ownerId: json['o_i'],
        restaurantName: json['name'],
        languageId: json['category'],
        firstname: json['f_n'],
        languageCode: json['l_c'],
        orderStatus: json['o_s'],
        productPrice: json['p_p'],
        extrThings: json['e_t'],
        paymentStatus: json['p_s'],
        orderItemStatus: json['o_i_s']);
  }
}
