import 'package:flutter/material.dart';
import 'package:fundamentos_flutter/config/router/app_routes_data.dart';
import 'package:go_router/go_router.dart';

class NavigationUtils {

  // Logica para centralizar las rutas de las tabs
  static void handleBottomNavClick(BuildContext context, int index) {
    switch (index) {
      case 0: context.go(AppRoutes.projectOneDemoPath); break;
      case 1: context.go(AppRoutes.projectTwoDemoPath); break;
    }
  }

  // Logica de seleccion de tabs para demos
  static int getBottomNavIndex(String location) {
    if(location.contains(AppRoutes.projectTwoDemoPath)) return  1;
    return 0;
  }

}