import 'package:flutter/material.dart';
import 'package:fundamentos_flutter/features/demos/insta_feed/presentation/widgets/main/historias_list.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
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
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 20,
              (context, index) {
                return Container(
                  height: 300,
                  margin: const EdgeInsets.all(10),
                  color: Colors.grey[200],
                  child: Center(child: Text('Post #$index')),
                );
              },
            )
          )
        ],
      )
    );
  }
}