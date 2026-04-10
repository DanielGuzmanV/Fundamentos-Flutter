import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InstaLayout extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const InstaLayout({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Aquí el cuerpo es el navigationShell (que intercambia las pantallas)
      body: navigationShell,
      
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navigationShell.currentIndex,
        onTap: (index) => navigationShell.goBranch(index),
        showSelectedLabels: true, // Estilo Instagram
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
        ],
      ),
    );
  }
}