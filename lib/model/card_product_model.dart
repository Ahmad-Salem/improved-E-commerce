class CardProductModel {
  late String productId;
  late String name;
  late String image;
  late int quantity;
  late String price;

  CardProductModel({
    required this.productId,
    required this.name,
    required this.image,
    required this.quantity,
    required this.price,
  });

  CardProductModel.fromJson(Map<dynamic, dynamic> map) {
    productId = map['productId'];
    name = map['name'];
    image = map['image'];
    price = map['price'].toString();
    quantity = int.parse(map['quantity']);
  }

  toJson() {
    return {
      'productId': productId,
      'name': name,
      'image': image,
      'price': int.parse(price),
      'quantity': quantity
    };
  }
}
