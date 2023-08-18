class UserModel {
  String? id;
  String? name;
  String? email;
  String? image;
  String? username;
  String? password;
  String? role;
  String? token;

  UserModel(
      {this.id,
      this.name,
      this.email,
      this.image,
      this.username,
      this.password,
      this.role,
      this.token});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    image = json['image'];
    username = json['username'];
    password = json['password'];
    role = json['role'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['image'] = image;
    data['username'] = username;
    data['password'] = password;
    data['role'] = role;
    data['token'] = token;
    return data;
  }
}
