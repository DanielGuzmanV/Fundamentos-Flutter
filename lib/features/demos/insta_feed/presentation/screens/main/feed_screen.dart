import 'package:flutter/material.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Insta Feed',
          style: TextStyle(fontFamily: 'Billabong', fontSize: 28),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: const Center(
        child: Text('El feed de noticias aparecerá aquí'),
      ),
    );
  }
}