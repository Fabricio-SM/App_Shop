import 'category.model.dart';

class ProductDetailsModel {
  String? id;
  String? title;
  String? tag;
  double? price;
  String? description;
  String? brand;
  List<String>? images;
  CategoryModel? category;

  ProductDetailsModel(
      {this.id,
      this.title,
      this.tag,
      this.price,
      this.description,
      this.brand,
      this.images,
      this.category});

  ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    tag = json['tag'];
    price = json['price'];
    description = json['description'];
    brand = json['brand'];
    images = json['images'].cast<String>();
    category = json['category'] != null
        ? CategoryModel.fromJson(json['category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['tag'] = tag;
    data['price'] = price;
    data['description'] = description;
    data['brand'] = brand;
    data['images'] = images;
    if (category != null) {
      data['category'] = category?.toJson();
    }
    return data;
  }
}
