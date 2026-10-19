import 'package:flutter/material.dart';
import 'package:fundamentos_flutter/features/home/presentation/widgets/basics/topic_3/product_card.dart';

class CompositionProps extends StatefulWidget {
  const CompositionProps({super.key});

  @override
  State<CompositionProps> createState() => _CompositionDemoSectionState();
}

class _CompositionDemoSectionState extends State<CompositionProps> {
  // Estado local para alterar las "props" que enviaremos al widget hijo
  String titleProduct = 'Laptop Pro';
  double priceProduct = 1299.99;
  bool isAvailableProduct = true;
  Color accentColor = Colors.indigo;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Controles para cambiar las props
          Card(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  const Text('Panel de Configuración de Props (Padre)',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  SwitchListTile(
                    title: const Text('Disponible en Stock'),
                    value: isAvailableProduct,
                    onChanged: (val) => setState(() => isAvailableProduct = val),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () => setState(() => accentColor = Colors.indigo),
                        child: const Text('Color Indigo'),
                      ),
                      ElevatedButton(
                        onPressed: () => setState(() => accentColor = Colors.teal),
                        child: const Text('Color Teal'),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),

          // WIDGET REUSABLE: Recibe las props por constructor
          ProductCard(
            title: titleProduct,
            price: priceProduct,
            isAvailable: isAvailableProduct,
            themeColor: accentColor,
            // Slot: Pasamos un Widget como prop (Composición)
            badge: isAvailableProduct
                ? const Chip(
                    label: Text('EN STOCK'),
                    backgroundColor: Colors.greenAccent,
                  )
                : const Chip(
                    label: Text('AGOTADO'),
                    backgroundColor: Colors.redAccent,
                  ),
            // Callback como prop
            onBuyPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Comprando $titleProduct por \$$priceProduct')),
              );
            },
          ),
        ],
      ),
    );
  }
}

