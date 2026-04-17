import 'package:flutter/material.dart';
import 'package:fundamentos_flutter/features/demos/insta_feed/presentation/widgets/hero/feature_card.dart';
import 'package:fundamentos_flutter/features/demos/insta_feed/presentation/widgets/hero/header_presentation.dart';
import 'package:fundamentos_flutter/shared/widgets/custom_button_nav.dart';

class PresentationInstaFeed extends StatelessWidget {
  const PresentationInstaFeed({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SingleChildScrollView( // Para que quepa en pantallas pequeñas
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header con Icono y Título
          HeaderPresentation(),

          const SizedBox(height: 24),

          // Tags de niveles
          const Wrap(
            spacing: 8,
            children: [
              _TechTag(label: 'UI Pro', color: Colors.blue),
              _TechTag(label: 'Performance', color: Colors.green),
              _TechTag(label: 'UX', color: Colors.orange),
            ],
          ),

          const SizedBox(height: 32),

          Text('Objetivo del Proyecto', style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),

          Text(
            'Recrear una experiencia de usuario fluida de red social, enfocándose en el rendimiento del scroll y la gestión eficiente de recursos multimedia.',
            style: textTheme.bodyLarge?.copyWith(color: Colors.black87),
          ),
          const SizedBox(height: 32),

          Text('Puntos Clave a Demostrar', style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),

          // Lista de características mejorada
          FeatureCard(
            icon: Icons.layers_outlined,
            title: 'CustomScrollView & Slivers',
            description: 'Uso de Slivers para headers colapsables y listas eficientes.',
          ),
          FeatureCard(
            icon: Icons.image_search_outlined,
            title: 'Caché de Imágenes',
            description: 'Optimización de carga y persistencia de imágenes en red.',
          ),
          FeatureCard(
            icon: Icons.hourglass_empty_rounded,
            title: 'Skeleton Loading',
            description: 'Mejora de la percepción de carga mediante placeholders animados.',
          ),

          const SizedBox(height: 40),

          // Botón de acción mejorado
          CustomButtonNav(
            label: 'Explorar Proyecto',
            route: '/insta-feed',
            icon: Icons.rocket_launch_rounded,
          )
        ],
      ),
    );
  }
}

// --- Widgets de apoyo ---

class _TechTag extends StatelessWidget {
  final String label;
  final Color color;
  const _TechTag({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.5)),
      ),
      child: Text(label, style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 12)),
    );
  }
}