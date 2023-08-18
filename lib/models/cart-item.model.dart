class CartItemModel {
  String? id;
  String? title;
  int? quantity;
  double? price;
  String? image;

  CartItemModel({
    this.id,
    this.title,
    this.quantity,
    this.price,
    this.image,
  });

  CartItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    quantity = json['quantity'];
    price = json['price'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['quantity'] = quantity;
    data['price'] = price;
    data['image'] = image;
    return data;
  }
}
