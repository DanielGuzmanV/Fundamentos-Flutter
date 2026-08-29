import 'package:flutter/material.dart';
import 'package:fundamentos_flutter/config/data/concept_item.dart';
import 'package:fundamentos_flutter/features/home/presentation/helpers/category_detail_mappers.dart';
import 'package:fundamentos_flutter/features/home/constants/topic_registry.dart';

class TopicDetailScreen extends StatelessWidget {
  final ConceptCategory category;
  final ConceptTopic topic;

  const TopicDetailScreen({
    super.key,
    required this.category,
    required this.topic,  
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final accentColor = CategoryDetailMappers.getLevelColor(category.level);

    return Scaffold(
      appBar: AppBar(title: Text(topic.title)),
      body: Column(
        children: [
          // Header de informacion del topic
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            color: accentColor.withOpacity(0.08),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      CategoryDetailMappers.getLevelIcon(category.level),
                      size: 20,
                      color: accentColor,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      category.title,
                      style: theme.textTheme.labelMedium?.copyWith(
                        color: accentColor,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 8),
                Text(
                  topic.title,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w800
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  topic.description,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),

              ],
            ),
          ),

          const Divider(height: 1),

          // Area dinamica de contenido / Demo
          Expanded(
            child: TopicRegistry.getDemoForTopic(topic.id)
          )
        ],
      ),
    );
 
   }
}