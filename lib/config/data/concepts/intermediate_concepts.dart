import 'package:fundamentos_flutter/config/data/concept_item.dart';

ConceptCategory intermediateConcepts = ConceptCategory(
  id: 'intermediate-concepts',
  title: 'Conceptos Intermedios de Flutter',
  description: 'Navegación declarativa, manejo de formularios, reactividad asíncrona y Clean Architecture.',
  level: ConceptLevel.intermediate,
  topics: [
    ConceptTopic(
      id: 'keys-globalkey-valuekey',
      title: 'Keys (GlobalKey, ValueKey)',
      description: 'Identificación de widgets para acceder a su estado interno o preservarlo durante reordenamientos y animaciones.',
    ),
    ConceptTopic(
      id: 'inherited-widget',
      title: 'InheritedWidget',
      description: 'La base técnica nativa equivalente a useContext. Permite propagar datos eficientemente por el árbol de widgets.',
    ),
    ConceptTopic(
      id: 'widget-composition-adv',
      title: 'Composición de Widgets Personalizados',
      description: 'Extracción y encapsulamiento de UI modular para reutilizar lógica visual y evitar código duplicado.',
    ),
    ConceptTopic(
      id: 'form-handling',
      title: 'Manejo de Formularios',
      description: 'Uso de Form, TextFormField y GlobalKey<FormState> para autovalidaciones y control de entrada.',
    ),
    ConceptTopic(
      id: 'gorouter-navigation',
      title: 'Navegación 2.0 (GoRouter)',
      description: 'Navegación declarativa avanzada con GoRouter, rutas anidadas (ShellRoute), deep linking y redirecciones.',
    ),
    ConceptTopic(
      id: 'async-futures-streams',
      title: 'Asincronía (FutureBuilder & StreamBuilder)',
      description: 'FutureBuilder para peticiones HTTP únicas y StreamBuilder para reactividad en tiempo real (Sockets/Firebase).',
    ),
    ConceptTopic(
      id: 'error-handling',
      title: 'Manejo de Errores',
      description: 'Captura de excepciones con bloques try/catch y personalización de pantallas de fallo con ErrorWidget.builder.',
    ),
    ConceptTopic(
      id: 'folder-structure-clean',
      title: 'Estructura de Carpetas (Clean Arch)',
      description: 'Organización modular por capas independientes de responsabilidad: Data, Domain y Presentation.',
    ),
    ConceptTopic(
      id: 'fp-dart',
      title: 'Programación Funcional en Dart',
      description: 'Procesamiento e inmutabilidad de datos usando operadores como map, where, fold y reduce.',
    ),
    ConceptTopic(
      id: 'state-management-intro',
      title: 'Gestores de Estado (Riverpod / BLoC Básico)',
      description: 'Introducción a la separación de lógica de negocio y UI mediante reactividad desacoplada de setState.',
    ),
  ],
);