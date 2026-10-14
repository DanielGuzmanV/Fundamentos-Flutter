import 'package:flutter/material.dart';

class StatelessCard extends StatelessWidget {
  final int parentCount;

  const StatelessCard({super.key, required this.parentCount});

  @override
  Widget build(BuildContext context) {
    // Variable local temporal (se resetea cada vez que el widget se reconstruye)
    int localClicks = 0;

    return Card(
      color: Colors.red.shade50,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.flash_off, color: Colors.red, size: 36),
            const SizedBox(height: 8),
            const Text(
              'StatelessWidget',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
            ),
            const Divider(),
            Text('Propiedad del Padre: $parentCount'),
            const SizedBox(height: 8),
            Text('Clicks Locales: $localClicks'),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                // Modificar esta variable no produce ningún cambio visual
                // porque Stateless no puede llamar a setState()
                localClicks++;
              },
              child: const Text('Incrementar Local', textAlign: TextAlign.center,),
            ),
            const SizedBox(height: 8),
            const Text(
              ' Intentar guardar estado local aquí no funciona.',
              style: TextStyle(fontSize: 12, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}