import 'package:flutter/material.dart';
import 'package:fundamentos_flutter/features/home/presentation/widgets/basics/topic_1/panel_control.dart';

class InteractiveDemoSection extends StatefulWidget {
  const InteractiveDemoSection({super.key});

  @override
  State<InteractiveDemoSection> createState() => _InteractiveDemoSectionState();
}

class _InteractiveDemoSectionState extends State<InteractiveDemoSection> {

  // Estados para la demo interactiva
  bool usePadding = true;
  bool useCenter = true;
  Color containerColor = Colors.deepPurple;

  String _generateCodeString() {
    String code = "Container(\n  color: $containerColor,\n  child: Text('...'),\n)";
    if (usePadding) {
      code = "Padding(\n  padding: EdgeInsets.all(24.0),\n  child: $code\n)";
    }
    if (useCenter) {
      code = "Center(\n  child: $code\n)";
    }
    return code;
  }

  @override
  Widget build(BuildContext context) {

    Widget content = Container(
      color: containerColor,
      padding: const EdgeInsets.all(12),
      child: const Text(
        '¡Soy un Widget!',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );

    if (usePadding) {
      content = Padding(
        padding: const EdgeInsets.all(24.0),
        child: content,
      );
    }

    if (useCenter) {
      content = Center(child: content);
    }

        return Column(
      children: [
        // Panel de Control
        PanelControl(
          usePadding: usePadding, 
          useCenter: useCenter,
          containerColor: containerColor, 
          onPaddingChanged: (val) => setState(() => usePadding = val), 
          onCenterChanged: (val) => setState(() => useCenter = val), 
          onColorChanged: (color) => setState(() => containerColor = color)
        ),

        // Área de Vista Previa
        Expanded(
          child: Container(
            width: double.infinity,
            color: Colors.grey.shade200,
            child: content,
          ),
        ),

        // Representación en Código del árbol actual
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          color: Colors.black87,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Árbol de Widgets equivalente:',
                style: TextStyle(color: Colors.grey, fontSize: 11),
              ),
              const SizedBox(height: 4),
              Text(
                _generateCodeString(),
                style: const TextStyle(
                  color: Colors.lightGreenAccent,
                  fontFamily: 'monospace',
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

