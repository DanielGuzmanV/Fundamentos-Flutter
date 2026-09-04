import 'package:flutter/material.dart';
import 'package:fundamentos_flutter/features/home/presentation/widgets/basics/topic_1/code_comparison_card.dart';

class ComparisonViewSection extends StatelessWidget {
  const ComparisonViewSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        // Explicacion principal:
        Card(
          elevation: 0,
          color: theme.colorScheme.surfaceContainerLow,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '💡 El principio "Todo es un Widget"',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'En React Native usas JSX con elementos de interfaz + estilos CSS en flexbox (style={{ padding: 10 }}).\n\n'
                  'En Flutter NO EXISTEN LOS ESTILOS CSS. El padding, el centrado y la alineación son WIDGETS en sí mismos que envuelven a otros widgets.',
                  style: theme.textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Comparativa Lado a Lado
        codeComparisonCard(
          context, 
          title: '1. Centrar un texto', 
          rnCode: 
'''
// React Native (JSX + Style)
<View style={{ flex: 1, justifyContent: 'center' }}>
  <Text>Hola Mundo</Text>
</View>''', 
          flutterCode:
'''
// Flutter (Widget Wrapper)
Center(
  child: Text('Hola Mundo'),
)''',
        ),

        const SizedBox(height: 12),

        codeComparisonCard(
          context, 
          title: '2. Agregar Espaciado (Padding)',
          rnCode: 
'''
// React Native
<View style={{ padding: 16 }}>
  <Text>Contenido</Text>
</View>''',
          flutterCode: 
'''
// Flutter
Padding(
  padding: EdgeInsets.all(16.0),
  child: Text('Contenido'),
)''',
        ),

        const SizedBox(height: 12),

        codeComparisonCard(
          context, 
          title: '3. Listas estructuradas (Column vs View)',
          rnCode: 
'''
// React Native
<View style={{ 
    flexDirection: 'column' 
  }}
>
  <Text>Uno</Text>
  <Text>Dos</Text>
</View>''',
          flutterCode: 
'''
// Flutter
Column(
  children: [
    Text('Uno'),
    Text('Dos'),
  ],
)''',
        ),
      ],
    );
  }
}