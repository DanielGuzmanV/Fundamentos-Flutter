import 'package:flutter/material.dart';
import 'package:fundamentos_flutter/features/home/presentation/topics/basics/widgets_vs_jsx.dart';

class TopicRegistry {
  static Widget getDemoForTopic(String topicId) {
    switch (topicId) {
      // Conceptos basicos
      case 'widgets-vs-jsx':
        return const WidgetsVsJsx();
      
      // Mejorar o crear un nuevo widget para el caso default 
      default:
        return const Center(
          child: Padding(
            padding: EdgeInsets.all(24.0),
            child: Text(
              'La demostracion para este concepto esta en desarrollo,',
              textAlign: TextAlign.center,
            ),
          ),
        );
    }
  }



}