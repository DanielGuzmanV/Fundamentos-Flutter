import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  // 1. Todas las props DEBEN ser final (inmutables)
  final String title;
  final double price;
  final bool isAvailable;
  final Color themeColor;
  final Widget? badge; // Prop opcional de tipo Widget (Slot)
  final VoidCallback onBuyPressed; // Prop de tipo Función/Callback

  // 2. Constructor con Parámetros Nombrados
  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.isAvailable,
    required this.themeColor,
    required this.onBuyPressed,
    this.badge, // Opcional
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: themeColor, width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: themeColor),
                ),
                if (badge != null) badge!, // Renderizado condicional del slot
              ],
            ),
            const SizedBox(height: 12),
            Text('Precio: \$$price', style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: themeColor),
              onPressed: isAvailable ? onBuyPressed : null, // Callback desactivado si no está disponible
              child: const Text('Comprar Ahora', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}