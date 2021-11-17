class UserModel {
  late String userId;
  late String email;
  late String name;
  late String pic;

  UserModel({
    required this.userId,
    required this.email,
    required this.name,
    required this.pic,
  });

  UserModel.fromjson(Map<dynamic, dynamic> map) {
    userId = map['userId'];
    email = map['email'];
    name = map['name'];
    pic = map['pic'];
  }

  toJson() {
    return {
      'userId': userId,
      'email': email,
      'name': name,
      'pic': pic,
    };
  }

  Map<String, dynamic> toJson1() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['email'] = email;
    data['name'] = name;
    data['pic'] = pic;
    return data;
  }
}
