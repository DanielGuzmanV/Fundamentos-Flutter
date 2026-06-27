import 'dart:math';

import 'package:fundamentos_flutter/features/demos/insta_feed/data/models/comment_model.dart';
import 'package:fundamentos_flutter/features/demos/insta_feed/domain/entities/comment.dart';
import 'package:fundamentos_flutter/features/demos/insta_feed/domain/entities/post.dart';
import 'package:fundamentos_flutter/features/demos/insta_feed/domain/entities/user.dart';

// Función de ayuda para deserializar una lista de posts
List<PostModel> postModelFromJson(dynamic jsonResponse)=>
    List<PostModel>.from(jsonResponse.map((x) => PostModel.fromJson(x)));

class PostModel {
  final int id;
  final int userId;
  final String title;
  final String body;

  final String imageUrl;
  final int likes; 
  final DateTime createdAt; 
  final List<CommentModel> comments;

  PostModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
    required this.imageUrl,
    required this.likes,
    required this.createdAt,
    this.comments = const [],
  });

  // Constructor factory para crear un PostModel a partir del JSON de JSONPlaceholder
  factory PostModel.fromJson(Map<String, dynamic> json) {
    final random = Random();

    // Generar datos adicionales que no vienen directamente de JSONPlaceholder
    final createdAt = DateTime.now().subtract(Duration(days: random.nextInt(365) + 1));
    final likes = random.nextInt(1000) + 50;
    // Usamos el id del post para una imagen de Picsum.photos, para que sea "persistente" para un post dado
    final imageUrl = 'https://picsum.photos/600/400?random=${json["id"]}';

    return PostModel(
      id: json["id"],
      userId: json["userId"],
      title: json["title"],
      body: json["body"],
      imageUrl: imageUrl,
      likes: likes,
      createdAt: createdAt,
      comments: [],
    );
  }

  // Este método toJson no es estrictamente necesario, pero es buena práctica incluirlo.
  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "title": title,
        "body": body,
        "imageUrl": imageUrl,
        "likes": likes,
        "createdAt": createdAt.toIso8601String(),
        "comments": List<dynamic>.from(comments.map((x) => x.toJson())),
      };

  // Método para mapear de PostModel (Data Layer) a Post (Domain Layer)
  Post toEntity({required User user, List<Comment> postComments = const []}) => Post(
        id: id.toString(),
        user: user,
        imageUrl: imageUrl,
        description: title,
        likes: likes,
        createdAt: createdAt,
        comments: postComments,
      );
}