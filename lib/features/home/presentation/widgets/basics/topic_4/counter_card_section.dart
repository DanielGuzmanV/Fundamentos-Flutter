import 'package:flutter/material.dart';

// ==========================================================
// SUB-WIDGET AISLADO: Contador con su propio State
// ==========================================================
class CounterCardSection extends StatefulWidget {
  const CounterCardSection({super.key});

  @override
  State<CounterCardSection> createState() => _CounterCardSectionState();
}

class _CounterCardSectionState extends State<CounterCardSection> {
  int _counter = 0;

  void _increment() {
    // BUENA PRÁCTICA: setState se ejecuta únicamente donde se necesita el cambio
    setState(() {
      _counter++;
    });
  }

  void _decrement() {
    setState(() {
      if (_counter > 0) _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Contador Aislado (Optimizado con setState local)',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),

            Text(
              '$_counter',
              style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.indigo),
            ),
            const SizedBox(height: 12),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: _decrement,
                  icon: const Icon(Icons.remove),
                  label: const Text('Menos'),
                ),
                const SizedBox(width: 12),
                ElevatedButton.icon(
                  onPressed: _increment,
                  icon: const Icon(Icons.add),
                  label: const Text('Más'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}