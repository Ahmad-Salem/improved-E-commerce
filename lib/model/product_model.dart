import 'package:flutter/cupertino.dart';
import 'package:salem/helper/extentions.dart';

class ProductModel {
  late String productId;
  late String name;
  late String image;
  late String description;
  late Color color;
  late String sized;
  late String price;

  ProductModel({
    required this.productId,
    required this.name,
    required this.image,
    required this.description,
    required this.color,
    required this.sized,
    required this.price,
  });

  ProductModel.fromJson(Map<dynamic, dynamic> map) {
    productId = map['productId'];
    name = map['name'];
    image = map['image'];
    description = map['description'];
    color = HexColor.fromHex(map['color']);
    sized = map['sized'];
    price = map['price'];
  }

  toJson() {
    return {
      'productId': productId,
      'name': name,
      'image': image,
      'description': description,
      'color': color,
      'sized': sized,
      'price': price,
    };
  }
}
