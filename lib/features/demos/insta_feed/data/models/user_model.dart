import 'package:fundamentos_flutter/features/demos/insta_feed/domain/entities/user.dart';

List<UserModel> userModelFromJson(dynamic jsonResponse) => 
  List<UserModel>.from(jsonResponse['results'].map((x) => UserModel.fromJson(x)));

class UserModel {
  final NameModel name;
  final LoginModel login;
  final PictureModel picture;

  UserModel({required this.name, required this.login, required this.picture});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    name: NameModel.fromJson(json["name"]),
    login: LoginModel.fromJson(json["login"]),
    picture: PictureModel.fromJson(json["picture"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name.toJson(),
    "login": login.toJson(),
    "picture": picture.toJson(),
  };

  // Método para mapear de UserModel (Data Layer) a User (Domain Layer)
  User toEntity() => User(
    id: login.uuid,
    username: login.username,
    profilePictureUrl: picture.large,
  );
}

class NameModel {
  final String first;
  final String last;

  NameModel({required this.first, required this.last});

  factory NameModel.fromJson(Map<String, dynamic> json) =>
      NameModel(first: json["first"], last: json["last"]);

  Map<String, dynamic> toJson() => {"first": first, "last": last};
}

class LoginModel {
  final String uuid;
  final String username;

  LoginModel({required this.uuid, required this.username});

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      LoginModel(uuid: json["uuid"], username: json["username"]);

  Map<String, dynamic> toJson() => {"uuid": uuid, "username": username};
}

class PictureModel {
  final String large;

  PictureModel({required this.large});

  factory PictureModel.fromJson(Map<String, dynamic> json) =>
      PictureModel(large: json["large"]);

  Map<String, dynamic> toJson() => {"large": large};
}