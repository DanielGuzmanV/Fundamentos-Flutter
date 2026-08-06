import 'package:flutter/material.dart';
import 'package:fundamentos_flutter/config/data/concept_item.dart';

class ConceptCardMappers {
  // Helper para el icono segun el level
  static IconData getIconForLevel(ConceptLevel level) {
    return switch (level) {
      ConceptLevel.basic => Icons.widgets_outlined,
      ConceptLevel.intermediate => Icons.alt_route_outlined,
      ConceptLevel.advanced => Icons.memory_outlined,
    };
  }

  // Helper para el estado del texto segun el level
  static String getStatusText(ConceptLevel level) {
    switch (level) {
      case ConceptLevel.basic:
        return 'Completado';
      case ConceptLevel.intermediate:
        return 'En Progreso';
      case ConceptLevel.advanced:
        return 'Próximamente';
    }
  }

  // Helper para el color segun el level
  static Color getStatusColor(ConceptLevel level) {
    switch (level) {
      case ConceptLevel.basic:
        return Colors.green;
      case ConceptLevel.intermediate:
        return Colors.orange;
      case ConceptLevel.advanced:
        return Colors.deepOrange;
    }
  }
}

