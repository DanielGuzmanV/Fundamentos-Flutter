import 'package:fundamentos_flutter/features/demos/insta_feed/domain/entities/comment.dart';
import 'package:fundamentos_flutter/features/demos/insta_feed/domain/entities/user.dart';

class Post {
  final String id;
  final User user;
  final String imageUrl;
  final String description;
  final int likes;
  final DateTime createdAt;
  final List<Comment> comments;

  const Post({
    required this.id,
    required this.user,
    required this.imageUrl,
    required this.description,
    this.likes = 0,
    required this.createdAt,
    this.comments = const [],
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
        other.createdAt == createdAt &&
        other.comments.length == comments.length;
  }

  @override
  int get hashCode =>
      id.hashCode ^
      user.hashCode ^
      imageUrl.hashCode ^
      description.hashCode ^
      likes.hashCode ^
      createdAt.hashCode ^
      comments.hashCode;
}
