import 'package:flutter/material.dart';
import 'package:fundamentos_flutter/features/home/presentation/widgets/basics/topic_2/stateful_card.dart';
import 'package:fundamentos_flutter/features/home/presentation/widgets/basics/topic_2/stateless_card.dart';

class StatelessVsStateful extends StatefulWidget {
  const StatelessVsStateful({super.key});

  @override
  State<StatelessVsStateful> createState() => _StatelessVsStatefulState();
}

class _StatelessVsStatefulState extends State<StatelessVsStateful> {
  int parentRebuildCount = 0;

  void _rebuildParent() {
    setState(() {
      parentRebuildCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Banner para forzar rebuild del padre
          Card(
            color: theme.colorScheme.primaryContainer,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Text(
                    'Reconstrucciones del Padre: $parentRebuildCount',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton.icon(
                    onPressed: _rebuildParent,
                    icon: const Icon(Icons.refresh),
                    label: const Text('Forzar setState() en el Padre'),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Comparativa visual de ambos widgets
          Expanded(
            child: Row(
              children: [
                // 1. Componente Stateless
                Expanded(
                  child: StatelessCard(parentCount: parentRebuildCount),
                ),
                const SizedBox(width: 12),
                // 2. Componente Stateful
                Expanded(
                  child: StatefulCard(parentCount: parentRebuildCount),
                  // child: StatefulCard(parentCount: parentRebuildCount),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}