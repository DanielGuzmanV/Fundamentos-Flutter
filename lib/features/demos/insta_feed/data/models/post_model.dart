import 'package:fundamentos_flutter/features/demos/insta_feed/data/models/user_model.dart';
import 'package:fundamentos_flutter/features/demos/insta_feed/domain/entities/post.dart';
import 'package:uuid/uuid.dart';

class PostModel {
  final String id;
  final UserModel user; // Un post contiene un UserModel
  final String imageUrl;
  final String description;
  final int likes;
  final DateTime createdAt;

  PostModel({
    required this.id,
    required this.user,
    required this.imageUrl,
    required this.description,
    required this.likes,
    required this.createdAt,
  });

  // Constructor factory para crear un PostModel de forma simplificada
  factory PostModel.create({
    required UserModel user,
    required String imageUrl,
    required String description,
    int likes = 0,
    DateTime? createdAt,
  }) {
    // Generamos un ID único para el post
    const uuid = Uuid(); 
    return PostModel(
      id: uuid.v4(),
      user: user,
      imageUrl: imageUrl,
      description: description,
      likes: likes,
      createdAt: createdAt ?? DateTime.now(), // Si no hay fecha, usa la actual
    );
  }

  // Método para mapear de PostModel (Data Layer) a Post (Domain Layer)
  Post toEntity() => Post(
        id: id,
        user: user.toEntity(), // Mapea el UserModel a User
        imageUrl: imageUrl,
        description: description,
        likes: likes,
        createdAt: createdAt,
      );
}