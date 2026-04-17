import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi Perfil'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.menu), // Icono de hamburguesa de perfil
            onPressed: () {
              _showSettings(context);
            },
          ),
        ],
      ),
      body: const Center(child: Text('Pantalla para el perfil')),
    );
  }

  void _showSettings(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Ajustes'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app, color: Colors.red),
              title: const Text('Salir de la Demo', style: TextStyle(color: Colors.red)),
              onTap: () {
                Navigator.pop(context); // Cierra el modal
                context.go('/demo/project-one'); // Sale de la demo hacia la presentación
              },
            ),
          ],
        ),
      ),
    );
  }
}
