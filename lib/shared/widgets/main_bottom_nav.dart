import 'package:flutter/material.dart';

class MainBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTabSelected;

  const MainBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTabSelected,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.devices),
          label: 'Demo 1'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.devices_other_outlined),
          label: 'Demo 2'
        )
      ]
    );
  }
}