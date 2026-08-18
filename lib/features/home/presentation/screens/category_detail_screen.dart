import 'package:flutter/material.dart';
import 'package:fundamentos_flutter/config/data/concept_item.dart';
import 'package:fundamentos_flutter/config/router/app_routes_data.dart';
import 'package:fundamentos_flutter/features/home/presentation/helpers/category_detail_mappers.dart';
import 'package:fundamentos_flutter/features/home/presentation/widgets/topic_item_card.dart';
import 'package:go_router/go_router.dart';

class CategoryDetailScreen extends StatelessWidget {
  final ConceptCategory category;
  
  const CategoryDetailScreen({
    super.key, 
    required this.category
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final accentColor = CategoryDetailMappers.getLevelColor(category.level);

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Banner Informativo del Nivel
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: accentColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: accentColor.withOpacity(0.3),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  CategoryDetailMappers.getLevelIcon(category.level),
                  size: 36,
                  color: accentColor,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    category.description,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          Text(
            'Temas de este nivel (${category.topics.length})',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          // Lista dinámica de temas
          ...category.topics.map(
            (topic) => Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TopicItemCard(
                topic: topic,
                accentColor: accentColor,
                onTap: () {
                  context.go(AppRoutes.conceptTopic(category.id, topic.id));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}