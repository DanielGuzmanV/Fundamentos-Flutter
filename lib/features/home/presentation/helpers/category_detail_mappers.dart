import 'package:flutter/material.dart';
import 'package:fundamentos_flutter/config/data/concept_item.dart';

class CategoryDetailMappers {
  static Color getLevelColor(ConceptLevel level) {
    return switch (level) {
      ConceptLevel.basic => Colors.green,
      ConceptLevel.intermediate => Colors.orange,
      ConceptLevel.advanced => Colors.deepOrange,
    };
  }
  
  static IconData getLevelIcon(ConceptLevel level) {
    return switch (level) {
      ConceptLevel.basic => Icons.widgets_outlined,
      ConceptLevel.intermediate => Icons.alt_route_outlined,
      ConceptLevel.advanced => Icons.memory_outlined,
    };
  }

}