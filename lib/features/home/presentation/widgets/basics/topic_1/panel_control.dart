import 'package:flutter/material.dart';

class PanelControl extends StatelessWidget {
  final bool usePadding;
  final bool useCenter;
  final Color containerColor;
  final ValueChanged<bool> onPaddingChanged;
  final ValueChanged<bool> onCenterChanged;
  final ValueChanged<Color> onColorChanged;

  const PanelControl({
    super.key, 
    required this.usePadding, 
    required this.useCenter, 
    required this.containerColor, 
    required this.onPaddingChanged, 
    required this.onCenterChanged, 
    required this.onColorChanged
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(16),
      color: theme.colorScheme.surfaceContainerHigh,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Añade o quita Widgets envolventes (Wrappers):',
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          SwitchListTile(
            dense: true,
            title: const Text('Envolver con Center(...)'),
            value: useCenter,
            onChanged: onCenterChanged,
          ),
          SwitchListTile(
            dense: true,
            title: const Text('Envolver con Padding(24.0)'),
            value: usePadding,
            onChanged: onPaddingChanged,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Color del Container:'),
              Wrap(
                spacing: 8,
                children: [
                  Colors.deepPurple,
                  Colors.indigo,
                  Colors.teal,
                  Colors.orange
                ].map((color) => GestureDetector(
                    onTap: () => onColorChanged(color),
                    child: CircleAvatar(
                      radius: 12,
                      backgroundColor: color,
                      child: containerColor == color
                          ? const Icon(Icons.check,
                              size: 12, color: Colors.white)
                          : null,
                    ),
                  )).toList(),
              ),
            ],
          ),
        ],
      ),

    );
  }
}