import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomButtonNav extends StatelessWidget {
  final String label;
  final String route;
  final IconData icon;
  final Color backgroundColor;
  final Color foregroundColor;

  const CustomButtonNav({
    super.key,
    required this.label,
    required this.route,
    this.icon = Icons.play_arrow_rounded,
    this.backgroundColor = Colors.black,
    this.foregroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton.icon(
        // Ahora la ruta es dinámica
        onPressed: () => context.push(route), 
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 0,
        ),
        icon: Icon(icon),
        label: Text(
          label.toUpperCase(), 
          style: const TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.1)
        ),
      ),
    );
  }
}