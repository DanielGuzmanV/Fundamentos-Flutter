import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fundamentos_flutter/features/demos/insta_feed/presentation/providers/providers.dart';
import 'package:fundamentos_flutter/features/demos/insta_feed/presentation/widgets/main/historias_list.dart';
import 'package:fundamentos_flutter/features/demos/insta_feed/presentation/widgets/main/post_card.dart';

class FeedScreen extends ConsumerWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Observar el estado del proveedor de posts
    final feedPostsAsyncValue =  ref.watch(feedPostNotifierProvider);

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => ref.read(feedPostNotifierProvider.notifier).refreshPost(),
        child: CustomScrollView(
          slivers: [
            // Barra superior:
            const SliverAppBar(
              floating: true,
              title: Text(
                'Insta Feed',
                style: TextStyle(
                  fontFamily: 'Billabong',
                  fontSize: 26,
                ),
              ),
              centerTitle: true,
            ),
        
            // Seccion de historias:
            SliverToBoxAdapter(
              child: HistoriasList()
            ),
        
            // El feed de posts:
            feedPostsAsyncValue.when(
              loading: () => SliverToBoxAdapter(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),

              error: (err, stack) => SliverToBoxAdapter(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Icon(Icons.error_outline, color: Colors.red, size: 40),
                        SizedBox(height: 10),
                        Text(
                          'Error al cargar posts: $err',
                          textAlign: TextAlign.center,
                        ),
                        ElevatedButton(
                          onPressed: () => ref
                              .read(feedPostNotifierProvider.notifier)
                              .loadPosts(),
                          child: Text('Reintentar'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              data: (posts) {
                // 🔴 Si tenemos datos, mostramos la lista de posts
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount:
                        posts.length, // Usamos la cantidad real de posts
                    (context, index) {
                      final post = posts[index];
                      return PostCard(
                        post: post,
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      )
    );
  }
}