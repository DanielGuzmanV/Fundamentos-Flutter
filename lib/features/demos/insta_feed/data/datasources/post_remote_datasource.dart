import 'package:dio/dio.dart';
import 'package:fundamentos_flutter/core/constants/api_constants.dart';
import 'package:fundamentos_flutter/features/demos/insta_feed/data/models/comment_model.dart';
import 'package:fundamentos_flutter/features/demos/insta_feed/data/models/post_model.dart';
import 'package:fundamentos_flutter/features/demos/insta_feed/data/models/user_model.dart';

class PostRemoteDatasource {
  final Dio dio;

  PostRemoteDatasource({required this.dio});

  // Traer usuarios de RandomUser.me
  Future<List<UserModel>> getUsers({int count = 10}) async {
    final response = await dio.get('${ApiConstants.randomUserEndpoint}$count');
    return userModelFromJson(response.data.toString());
  }

  // Traer posts de JSONPlaceholder
  Future<List<PostModel>> getPosts() async {
    final response = await dio.get(ApiConstants.jsonPlaceholderPostsEndpoint);
    final List<dynamic> data = response.data;
    return data.map((json) => PostModel.fromJson(json)).toList();
  }

  // Traer comentarios de JSONPlaceholder
  Future<List<CommentModel>> getComments() async {
    final response = await dio.get(ApiConstants.jsonPlaceholderCommentsEndpoint);
    final List<dynamic> data = response.data;
    return data.map((json) => CommentModel.fromJson(json)).toList();
  }
}