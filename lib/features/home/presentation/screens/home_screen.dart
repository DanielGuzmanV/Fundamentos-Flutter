import 'package:flutter/material.dart';
import 'package:fundamentos_flutter/config/data/concept_data.dart';
import 'package:fundamentos_flutter/features/home/presentation/helpers/concept_card_mapppers.dart';
import 'package:fundamentos_flutter/features/home/presentation/widgets/concept_card.dart';
import 'package:fundamentos_flutter/features/home/presentation/widgets/home_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        padding: const EdgeInsets.all(16.0),
        itemCount: conceptsList.length + 1,
        separatorBuilder: (context, index) => SizedBox(height: 12),
        itemBuilder: (context, index) {
          if(index == 0) {
            return const HomeHeader();
          }

          final category = conceptsList[index - 1];

          return ConceptCard(
            icon: ConceptCardMappers.getIconForLevel(category.level), 
            title: category.title, 
            description: category.description, 
            status: ConceptCardMappers.getStatusText(category.level), 
            statusColor: ConceptCardMappers.getStatusColor(category.level), 
            onTap: () {
              // TODO: Navegar a la pantalla de detalle pasando `category` o `category.id`
            }
          );
        },
      ),
    );
  }
}


