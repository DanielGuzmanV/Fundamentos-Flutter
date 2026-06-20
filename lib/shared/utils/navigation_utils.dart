import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigationUtils {

  // Logica para centralizar las ruts de las tabs
  static void handleBottomNavClick(BuildContext context, int index) {
    switch (index) {
      case 0: context.go('/demo/project-one'); break;
      case 1: context.go('/demo/project-two'); break;
    }
  }

  // Logica de seleccion de tabs para demos
  static int getBottomNavIndex(String location) {
    if(location.contains('project-two')) return  1;
    return 0;
  }

}