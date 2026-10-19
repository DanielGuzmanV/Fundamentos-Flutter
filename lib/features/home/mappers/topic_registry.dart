import 'package:flutter/material.dart';
import 'package:fundamentos_flutter/features/home/presentation/topics/basics/composition_props.dart';
import 'package:fundamentos_flutter/features/home/presentation/topics/basics/stateless_vs_stateful.dart';
import 'package:fundamentos_flutter/features/home/presentation/topics/basics/widgets_vs_jsx.dart';
import 'package:fundamentos_flutter/shared/widgets/topic_under_construction.dart';

class TopicRegistry {
  static Widget getDemoForTopic(String topicId) {
    switch (topicId) {
      // Conceptos basicos
      case 'widgets-vs-jsx':
        return const WidgetsVsJsx();
      case 'stateless-vs-stateful':
        return const StatelessVsStateful();
      case 'composition-props':
        return const CompositionProps();
    
      default:
        return TopicUnderConstruction(topicId: topicId,);
    }
  }



}