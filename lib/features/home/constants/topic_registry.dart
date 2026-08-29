import 'package:flutter/material.dart';
import 'package:fundamentos_flutter/features/home/presentation/topics/basics/widgets_vs_jsx.dart';
import 'package:fundamentos_flutter/shared/widgets/topic_under_construction.dart';

class TopicRegistry {
  static Widget getDemoForTopic(String topicId) {
    switch (topicId) {
      // Conceptos basicos
      case 'widgets-vs-jsx':
        return const WidgetsVsJsx();
    
      default:
        return TopicUnderConstruction(topicId: topicId,);
    }
  }



}