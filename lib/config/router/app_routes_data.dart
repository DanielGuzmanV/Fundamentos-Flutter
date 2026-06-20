import 'package:flutter/material.dart';

class AppRouteItem {
  final String path;
  final IconData icon;
  final String label;
  final bool showBottomBar;

  const AppRouteItem({
    required this.path,
    required this.icon,
    required this.label,
    this.showBottomBar = false,
  });

  // Metodo para obtener el indice de esta ruta en la lista principal de las ramas
  int getIndex(List<AppRouteItem> routes) {
    return routes.indexOf(this);
  }
}

// Lista centralizada de las opciones de navegacion principales
final List<AppRouteItem> mainNavigationItems = [
  AppRouteItem(path: '/', icon: Icons.home, label: 'Inicio'),
  AppRouteItem(path: '/examples', icon: Icons.code, label: 'Proyecto 1'),
  AppRouteItem(path: '/demo/project-one', icon: Icons.drive_file_move, label: 'Explorar Demos', showBottomBar: true),
  AppRouteItem(path: '/settings', icon: Icons.settings, label: 'Ajustes'),
];