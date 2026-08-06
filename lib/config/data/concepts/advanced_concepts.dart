import 'package:fundamentos_flutter/config/data/concept_item.dart';

ConceptCategory advancedConcepts = ConceptCategory(
  id: 'advanced-concepts',
  title: 'Conceptos Avanzados de Flutter',
  description: 'Arquitectura profesional, rendimiento de motor, concurrencia, código nativo y testing.',
  level: ConceptLevel.advanced,
  topics: [
    ConceptTopic(
      id: 'platform-channels',
      title: 'Platform Channels (Method Channels)',
      description: 'Comunicación bidireccional asíncrona entre el código Dart y APIs nativas de iOS (Swift) y Android (Kotlin).',
    ),
    ConceptTopic(
      id: 'pro-state-management',
      title: 'Gestión de Estado Profesional (Riverpod / BLoC)',
      description: 'Implementación de BLoC (eventos/estados) y Riverpod (inyección de dependencias reactiva) para apps de nivel empresarial.',
    ),
    ConceptTopic(
      id: 'performance-optimization',
      title: 'Performance & Optimización',
      description: 'Uso estratégico de const, aislamiento de repintado con RepaintBoundary y perfilado con Flutter DevTools.',
    ),
    ConceptTopic(
      id: 'animations-implicit-explicit',
      title: 'Animaciones (Implícitas, Explícitas & Rive)',
      description: 'Control de animaciones con AnimatedContainer, AnimationController para control fino y motores vectoriales como Rive.',
    ),
    ConceptTopic(
      id: 'testing-suite',
      title: 'Testing Profesional (Unit, Widget & Integration)',
      description: 'Cobertura de código completa mediante pruebas unitarias, de interfaz y flujos end-to-end con integration_test.',
    ),
    ConceptTopic(
      id: 'gestures-pro',
      title: 'Gestures Pro & RenderObjects',
      description: 'Control avanzado de eventos táctiles, hit-testing personalizado y manipulación directa en la capa de RenderObject.',
    ),
    ConceptTopic(
      id: 'isolates-multithreading',
      title: 'Isolates (Multithreading)',
      description: 'Ejecución de procesamiento pesado en hilos de memoria independientes para no congelar el hilo de UI.',
    ),
    ConceptTopic(
      id: 'ffi-c-rust',
      title: 'FFI (Foreign Function Interface)',
      description: 'Invocación directa de librerías nativas de alto rendimiento escritas en C, C++ o Rust sin el overhead de Method Channels.',
    ),
    ConceptTopic(
      id: 'graphics-impeller',
      title: 'Motor de Renderizado Impeller',
      description: 'Funcionamiento interno del motor gráfico de Flutter enfocado en eliminar el shader compilation jank.',
    ),
    ConceptTopic(
      id: 'adaptive-responsive',
      title: 'Diseño Adaptativo & Responsivo',
      description: 'Estrategias de maquetación para soporte unificado en múltiples plataformas: Mobile, Web y Desktop.',
    ),
    ConceptTopic(
      id: 'dart-macros',
      title: 'Dart Macros',
      description: 'Metaprogramación en tiempo de compilación para generación automática de código sin depender de build_runner.',
    ),
    ConceptTopic(
      id: 'wasm-web-multithreading',
      title: 'WebAssembly (Wasm) & Web Multi-threading',
      description: 'Compilación a Wasm para ejecución cercana a rendimiento nativo en navegadores modernos.',
    ),
  ],
);