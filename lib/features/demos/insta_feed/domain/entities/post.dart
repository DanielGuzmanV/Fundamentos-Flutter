import 'package:fundamentos_flutter/features/demos/insta_feed/domain/entities/user.dart';

class Post {
  final String id;
  final User user;
  final String imageUrl;
  final String description;
  final int likes;
  final DateTime createdAt;

  const Post({
    required this.id,
    required this.user,
    required this.imageUrl,
    required this.description,
    this.likes = 0,
    required this.createdAt,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Post &&
        other.id == id &&
        other.user == user && // Compara objetos User
        other.imageUrl == imageUrl &&
        other.description == description &&
        other.likes == likes &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode =>
      id.hashCode ^
      user.hashCode ^
      imageUrl.hashCode ^
      description.hashCode ^
      likes.hashCode ^
      createdAt.hashCode;
}
