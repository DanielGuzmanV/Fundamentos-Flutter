import 'package:dio/dio.dart';
import 'package:fundamentos_flutter/features/demos/insta_feed/data/datasources/post_remote_datasource.dart';
import 'package:fundamentos_flutter/features/demos/insta_feed/data/models/comment_model.dart';
import 'package:fundamentos_flutter/features/demos/insta_feed/data/models/post_model.dart';
import 'package:fundamentos_flutter/features/demos/insta_feed/data/models/user_model.dart';
import 'package:fundamentos_flutter/features/demos/insta_feed/domain/entities/comment.dart';
import 'package:fundamentos_flutter/features/demos/insta_feed/domain/entities/post.dart';
import 'package:fundamentos_flutter/features/demos/insta_feed/domain/entities/user.dart';
import 'package:fundamentos_flutter/features/demos/insta_feed/domain/repositories/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDatasource remoteDataSource;

  PostRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Post>> getFeedPosts() async {
    try {
      // 1. Obtener todos los datos crudos de las APIs de forma concurrente
      final List<UserModel> userModels = await remoteDataSource.getUsers();
      final List<PostModel> postModels = await remoteDataSource.getPosts();
      final List<CommentModel> commentModels = await remoteDataSource.getComments();

      // 2. Crear un mapa de usuarios para un acceso rápido por ID (UUID)
      // Como JSONPlaceholder no usa UUIDs, haremos un truco para asociar por índice
      final Map<int, UserModel> userModelMap = {
        for (int i = 0; i < userModels.length; i++) i + 1: userModels[i]
      }; // Mapea userId 1 al userModels[0], userId 2 al userModels[1], etc.

      // 3. Crear un mapa de comentarios agrupados por postId para acceso rápido
      final Map<int, List<CommentModel>> commentsByPostId = {};
      for (var comment in commentModels) {
        commentsByPostId.putIfAbsent(comment.postId, () => []).add(comment);
      }

      // 4. Procesar y combinar los PostModels en entidades Post
      final List<Post> posts = [];
      for (var postModel in postModels) {
        // Asignar un usuario de RandomUser.me al post basado en userId
        final UserModel? postUserModel = userModelMap[postModel.userId];

        // Si no encontramos un usuario, saltamos este post (o asignamos uno por defecto)
        if (postUserModel == null) {
          // Opcional: Loggear un error o asignar un usuario por defecto
          // print('Error: User not found for userId: ${postModel.userId}');
          continue; 
        }

        // Obtener los comentarios para este post
        final List<CommentModel> postCommentModels = commentsByPostId[postModel.id] ?? [];

        // Mapear el UserModel a la entidad User
        final User userEntity = postUserModel.toEntity();

        // Mapear los CommentModels a entidades Comment
        final List<Comment> commentEntities = 
            postCommentModels.map((cm) => cm.toEntity()).toList();

        // Finalmente, construir la entidad Post completa
        posts.add(postModel.toEntity(user: userEntity, postComments: commentEntities));
      }

      return posts;
    } on DioException catch (e) {
      // 🔴 Manejo de errores profesional
      // Aquí puedes mapear errores de Dio a errores de tu dominio (ej. NetworkException, ServerException)
      // Para la demo, simplemente relanzamos el error de Dio o uno genérico.
      print('Error fetching feed posts: $e');
      throw Exception('Failed to load posts from API: ${e.message}');
    } catch (e) {
      // Otros errores inesperados
      print('An unexpected error occurred: $e');
      throw Exception('An unexpected error occurred while loading posts.');
    }
  }
}