import 'dart:convert';
import 'package:fundamentos_flutter/features/demos/insta_feed/domain/entities/comment.dart';

// Función de ayuda para deserializar una lista de comentarios
List<CommentModel> commentModelFromJson(String str) => 
    List<CommentModel>.from(json.decode(str).map((x) => CommentModel.fromJson(x)));

class CommentModel {
  final int id;
  final int postId;
  final String name;
  final String email;
  final String body;

  CommentModel({
    required this.id,
    required this.postId,
    required this.name,
    required this.email,
    required this.body,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
        id: json["id"],
        postId: json["postId"],
        name: json["name"],
        email: json["email"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "postId": postId,
        "name": name,
        "email": email,
        "body": body,
      };

  // Método para mapear de CommentModel (Data Layer) a Comment (Domain Layer)
  Comment toEntity() => Comment(
        id: id.toString(), // Convertimos int a String para que coincida con la entidad
        postId: postId.toString(), // Convertimos int a String
        name: name,
        email: email,
        body: body,
      );
}