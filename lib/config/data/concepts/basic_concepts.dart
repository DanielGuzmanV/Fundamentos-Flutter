import 'package:fundamentos_flutter/config/data/concept_item.dart';

ConceptCategory basicConcepts = ConceptCategory(
  id: 'basic-concepts',
  title: 'Conceptos Básicos',
  description: 'Fundamentos de UI, ciclo de vida de widgets, layouts, estado básico y sintaxis de Dart 3.',
  level: ConceptLevel.basic,
  topics: [
    ConceptTopic(
      id: 'widgets-vs-jsx',
      title: 'Widgets (vs JSX)',
      description: 'En Flutter "todo es un Widget". No hay etiquetas tipo HTML; usas clases de Dart para construir la UI.',
    ),
    ConceptTopic(
      id: 'stateless-vs-stateful',
      title: 'Stateless vs. Stateful Widgets',
      description: 'Stateless: Componentes sin estado interno. Stateful: Componentes que mantienen datos mutables.',
    ),
    ConceptTopic(
      id: 'composition-props',
      title: 'Composición (Props)',
      description: 'Los datos se pasan a través del constructor de la clase. Son campos declarados como final (inmutables).',
    ),
    ConceptTopic(
      id: 'state-setstate',
      title: 'Estado (setState)',
      description: 'La forma nativa y básica de notificar cambios a la UI para reconstruir el árbol de widgets.',
    ),
    ConceptTopic(
      id: 'events-callbacks',
      title: 'Eventos & Callbacks',
      description: 'Manejo de interacción con callbacks como onPressed, onChanged, onTap.',
    ),
    ConceptTopic(
      id: 'conditional-rendering',
      title: 'Renderizado Condicional',
      description: 'Uso de colecciones con if y spread operators (...) directamente dentro de listas de widgets.',
    ),
    ConceptTopic(
      id: 'lists-listview',
      title: 'Listas Eficientes (ListView.builder)',
      description: 'Renderizado perezoso de listas masivas. Uso de keys para preservar estado.',
    ),
    ConceptTopic(
      id: 'layout-system',
      title: 'Layout System',
      description: 'Estructuración sin CSS mediante widgets dedicados: Row, Column, Stack, Container, Padding.',
    ),
    ConceptTopic(
      id: 'component-equivalences',
      title: 'Equivalencias de Componentes',
      description: 'Mapeo conceptual desde React Native/Web: <View> → Container/SizedBox, <Text> → Text, <TouchableOpacity> → InkWell.',
    ),
    ConceptTopic(
      id: 'styles-themedata',
      title: 'Estilos & ThemeData',
      description: 'Configuración global en MaterialApp usando el sistema de diseño Material 3.',
    ),
    ConceptTopic(
      id: 'declarative-ui',
      title: 'Declarative UI',
      description: 'Paradigma declarativo: describes cómo debe verse la UI en función del estado actual.',
    ),
    ConceptTopic(
      id: 'dart3-records-patterns',
      title: 'Dart 3: Records & Patterns',
      description: 'Desestructuración de datos y Pattern Matching para renderizado condicional limpio.',
    ),
  ],
);