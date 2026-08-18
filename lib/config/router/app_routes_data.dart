import 'package:flutter/material.dart';

// Catalogo de rutas:
abstract class AppRoutes {
  // Nombres de rutas (para context.goNamed)
  static const String home = 'home';
  static const String categoryDetail = 'category-detail';
  static const String topicDetail = 'topic-detail';
  static const String examples = 'examples';
  static const String projectOneDemo = 'project-one-demo';
  static const String projectTwoDemo = 'project-two-demo';
  static const String settings = 'settings';

  // Paths principales
  static const String homePath = '/';
  static const String examplesPath = '/examples';
  static const String projectOneDemoPath = '/demo/project-one';
  static const String projectTwoDemoPath = '/demo/project-two';
  static const String settingsPath = '/settings';

  // Subrutas dinamicas
  static const String categoryDetailPath = 'concepts/:id';
  static const String topicDetailPath = ':topicId';

  // Métodos helper para construir URLs dinámicas sin concatenar a mano
  static String conceptCategory(String categoryId) => '/concepts/$categoryId';
  static String conceptTopic(String categoryId, String topicId) => '/concepts/$categoryId/$topicId';

}

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
  AppRouteItem(path: AppRoutes.homePath, icon: Icons.home, label: 'Inicio'),
  AppRouteItem(path: AppRoutes.examplesPath, icon: Icons.code, label: 'Proyecto 1'),
  AppRouteItem(path: AppRoutes.projectOneDemoPath, icon: Icons.drive_file_move, label: 'Explorar Demos', showBottomBar: true),
  AppRouteItem(path: AppRoutes.settingsPath, icon: Icons.settings, label: 'Ajustes'),
];