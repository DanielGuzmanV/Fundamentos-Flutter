import 'package:flutter/material.dart';
import 'package:fundamentos_flutter/features/home/presentation/widgets/basics/topic_4/counter_card_section.dart';
import 'package:fundamentos_flutter/features/home/presentation/widgets/basics/topic_4/form_card_section.dart';

class StateSetstate extends StatelessWidget {
  const StateSetstate({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Demostración de setState() Localizado',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'Nota: Cada sección encapsula su propio State para evitar reconstruir widgets innecesarios.',
            style: TextStyle(color: Colors.grey, fontSize: 13),
          ),
          const SizedBox(height: 20),

          // 1. Componente de Contador Aislado (setState local)
          const CounterCardSection(),
          const SizedBox(height: 20),

          // 2. Componente de Formulario con TextEditingController y setState
          const FormCardSection()
        ],
      ),
    );
  }
}

