import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PresentationInstaFeed extends StatelessWidget {
  const PresentationInstaFeed({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Demo 1: Insta-Feed',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text('En este proyecto cubriremos:'),
          const Text('CustomScrollView & Slivers (UI Avanzada)'),
          const Text('Caché de imágenes con redes'),
          const Text('Skeleton Loading (UX)'),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () =>
                  context.push('/insta-feed'), // Navega fuera del Wrapper
              child: const Text('Comenzar Demo'),
            ),
          ),
        ],
      ),
    );
    
  }
}