import 'package:flutter/material.dart';

class TopicUnderConstruction extends StatelessWidget {
  final String? topicId;
  final String? title;
  final String? description;

  const TopicUnderConstruction({
    super.key,
    this.topicId,
    this.title = 'Demostracion en desarrollo',
    this.description = 'Estamos preparando el contenido interactivo y los ejemplos prácticos para este concepto.'

  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icono:
            Container(
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerHigh,
                shape: BoxShape.circle
              ),
              child: Icon(
                Icons.construction_rounded,
                size: 48,
                color: colorScheme.primary,
              ),
            ),
            const SizedBox(height: 24),

            // Título de estado
            Text(
              '$title',
              textAlign: TextAlign.center,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 8),

            // Descripción
            Text(
              '$description',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),

            if(topicId != null) ...[
              const SizedBox(height: 20),
              Chip(
                backgroundColor: colorScheme.surfaceContainerLow,
                side: BorderSide(color: colorScheme.outlineVariant),
                avatar: Icon(
                  Icons.code,
                  size: 16,
                  color: colorScheme.outline,
                ),
                label: Text(
                  topicId!,
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: colorScheme.outline,
                    fontFamily: 'monospace',
                  ),
                ),
              ),
            ]

          ],
        ),
      ),
    );
  }
}