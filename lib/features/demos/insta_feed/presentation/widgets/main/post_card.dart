import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fundamentos_flutter/features/demos/insta_feed/domain/entities/post.dart';
import 'package:intl/intl.dart';

class PostCard extends StatelessWidget {
  final Post post;

  const PostCard({
    super.key,
    required this.post
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Cabecera del post (avatar y nombre de usuario)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: Row(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundImage: CachedNetworkImageProvider(post.user.profilePictureUrl),
              ),
              const SizedBox(width: 8),
              Text(
                post.user.username,
                style: textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold)
              ),
              const Spacer(),
              const Icon(Icons.more_vert)
            ],
          ),
        ),

        // Imagen del post
        CachedNetworkImage(
          imageUrl: post.imageUrl,
          width: double.infinity,
          height: 300,
          fit: BoxFit.cover,
          placeholder: (context, url) => Container(
            height: 300,
            color: Colors.grey[200],
            child: const Center(child: CircularProgressIndicator(strokeWidth: 2))
          ),
          errorWidget: (context, url, error) => Container(
            height: 300,
            color: Colors.red[100],
            child: const Center(child: Icon(Icons.error, color: Colors.red)),
          ),
        ),

        // Barra de acciones (likes, comentarios y compartir)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.favorite_outline),
                onPressed: () {
                  // Lógica de "Like" (más adelante con Riverpod)
                },
              ),
              IconButton(
                icon: const Icon(Icons.comment_outlined),
                onPressed: () {
                  // Navegar a la pantalla de comentarios
                },
              ),
              IconButton(
                icon: const Icon(Icons.send_outlined),
                onPressed: () {
                  // Compartir
                },
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.bookmark_outline),
                onPressed: () {
                  // Guardar post
                },
              ),
            ],
          ),
        ),

        // Conteo de likes y descripcion
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${post.likes} me gusta',
                style: textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              // Descripción (puedes añadir "ver más" aquí)
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '${post.user.username} ',
                      style: textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: post.description,
                      style: textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 4),
              // Ver comentarios (simulado por ahora)
              Text(
                'Ver los ${post.comments.length} comentarios',
                style: textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
              ),
              const SizedBox(height: 4),
              Text(
                DateFormat.yMMMd().format(post.createdAt), // Fecha formateada
                style: textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}