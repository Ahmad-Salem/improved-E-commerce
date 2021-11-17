class CategoryModel {
  late String name;
  late String image;

  CategoryModel({
    required this.name,
    required this.image,
  });

  CategoryModel.fromjson(Map<dynamic, dynamic> map) {
    name = map['name'];
    image = map['image'];
  }

  toJson() {
    return {'name': name, 'image': image};
  }
}
