import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:fundamentos_flutter/features/demos/insta_feed/data/datasources/post_remote_datasource.dart';
import 'package:fundamentos_flutter/features/demos/insta_feed/data/repositories/post_repository_impl.dart';
import 'package:fundamentos_flutter/features/demos/insta_feed/domain/entities/post.dart';
import 'package:fundamentos_flutter/features/demos/insta_feed/domain/repositories/post_repository.dart';
import 'package:fundamentos_flutter/features/demos/insta_feed/domain/usecases/get_feed_posts.dart';

// Proveedor de Dio
final dioProvider = Provider<Dio>((ref) {
  return Dio();
});

// Proveedor del data/datasource 
final postRemoteDataSourceProvider = Provider<PostRemoteDatasource>((ref) {
  final dio = ref.watch(dioProvider);
  return PostRemoteDatasource(dio: dio);
});

// Proveedor del data/repositories
final postRepositoryProvider = Provider<PostRepository>((ref) {
  final remoteDataSource = ref.watch(postRemoteDataSourceProvider);
  return PostRepositoryImpl(remoteDataSource: remoteDataSource);
});

// Proveedor del domain/usecases
final getFeedPostsUseCaseProvider = Provider<GetFeedPosts>((ref) {
  final repository = ref.watch(postRepositoryProvider);
  return GetFeedPosts(repository: repository);
});

// El Notifier de Riverpod para gestionar el estado de los post del feed
final feedPostNotifierProvider = StateNotifierProvider<FeedPostsNotifier, AsyncValue<List<Post>>>((ref) {
  final getFeedPost = ref.watch(getFeedPostsUseCaseProvider);
  return FeedPostsNotifier(getFeedPosts: getFeedPost);
});

class FeedPostsNotifier extends StateNotifier<AsyncValue<List<Post>>> {
  final GetFeedPosts getFeedPosts;

  FeedPostsNotifier({required this.getFeedPosts}) : super(const AsyncValue.loading()) {
    loadPosts();
  }

  // Metodo para cargar los post
  Future<void> loadPosts() async {
    state = const AsyncValue.loading();
    try {
      final posts = await getFeedPosts.call();
      state = AsyncValue.data(posts);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  // Metodo para refrescar los post
  Future<void> refreshPost() async {
    state = AsyncValue.loading();
    try {
      final posts = await getFeedPosts.call();
      state = AsyncValue.data(posts);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }

  }
}