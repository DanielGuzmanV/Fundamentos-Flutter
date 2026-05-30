import 'package:fundamentos_flutter/features/demos/insta_feed/domain/entities/post.dart';
import 'package:fundamentos_flutter/features/demos/insta_feed/domain/repositories/post_repository.dart';

class GetFeedPosts {
  final PostRepository repository;

  GetFeedPosts({required this.repository});

  Future<List<Post>> call() async {
    return await repository.getFeedPosts();
  }


}