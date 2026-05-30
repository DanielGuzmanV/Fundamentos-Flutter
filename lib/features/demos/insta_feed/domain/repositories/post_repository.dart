import 'package:fundamentos_flutter/features/demos/insta_feed/domain/entities/post.dart';

abstract class PostRepository {
  Future<List<Post>> getFeedPosts();
}