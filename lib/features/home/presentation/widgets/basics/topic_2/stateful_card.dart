import 'package:flutter/material.dart';

class StatefulCard extends StatefulWidget {
  final int parentCount;

  const StatefulCard({super.key, required this.parentCount});

  @override
  State<StatefulCard> createState() => _StatefulCardState();
}

class _StatefulCardState extends State<StatefulCard> {
  // Estado interno PERSISTENTE en la clase _StatefulCardState
  int localClicks = 0;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.green.shade50,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.memory, color: Colors.green, size: 36),
            const SizedBox(height: 8),
            const Text(
              'StatefulWidget',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
            ),
            const Divider(),
            // Acceso a la propiedad del widget padre usando 'widget.parentCount'
            Text('Propiedad del Padre: ${widget.parentCount}'),
            const SizedBox(height: 8),
            Text('Clicks Locales: $localClicks'),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  localClicks++;
                });
              },
              child: const Text('Incrementar Local', textAlign: TextAlign.center,),
            ),
            const SizedBox(height: 8),
            const Text(
              ' El objeto State conserva "localClicks" aunque el padre se reconstruya.',
              style: TextStyle(fontSize: 12, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}