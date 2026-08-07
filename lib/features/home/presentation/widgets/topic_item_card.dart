import 'package:flutter/material.dart';
import 'package:fundamentos_flutter/config/data/concept_item.dart';

class TopicItemCard extends StatelessWidget {
  final ConceptTopic topic;
  final Color accentColor;
  final VoidCallback onTap;

  const TopicItemCard({
    super.key, 
    required this.topic, 
    required this.accentColor, 
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: theme.colorScheme.outlineVariant.withOpacity(0.5),
        ),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        leading: CircleAvatar(
          backgroundColor: accentColor.withOpacity(0.15),
          child: Icon(
            Icons.code_outlined,
            color: accentColor,
            size: 20,
          ),
        ),
        title: Text(
          topic.title,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Text(
            topic.description,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}