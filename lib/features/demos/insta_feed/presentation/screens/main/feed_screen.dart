import 'package:flutter/material.dart';

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
            child: _HistoriasList()
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

class _HistoriasList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              children: [
                Container(
                  width: 65,
                  height: 65,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(
                      colors: [
                        Colors.yellow,
                        Colors.orange,
                        Colors.red,
                        Colors.purple,
                      ],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(3), // Espacio para el gradiente
                    child: CircleAvatar(
                      backgroundColor: Colors.grey[300],
                      child: Text('U-$index'),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Text('User $index', style: const TextStyle(fontSize: 12)),
              ],
            ),
          );
        },
      ),
    );
  }
}