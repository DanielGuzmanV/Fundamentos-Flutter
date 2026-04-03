import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InstaFeedScreen extends StatelessWidget {
  const InstaFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Este proyecto tendrá su propia lógica de navegación
      appBar: AppBar(
        title: const Text('Insta-Feed Demo'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(), // Regresa al Hub
        ),
      ),
      body: const Center(
        child: Text('Aquí empezaremos con la demo 1'),
      ),
    );
  }
}