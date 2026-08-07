import 'package:flutter/material.dart';
import 'package:fundamentos_flutter/config/data/concept_data.dart';
import 'package:fundamentos_flutter/features/home/presentation/screens/category_detail_screen.dart';
import 'package:fundamentos_flutter/shared/layouts/insta_layout.dart';
import 'package:go_router/go_router.dart';
import 'package:fundamentos_flutter/features/features_exports.dart';
import 'package:fundamentos_flutter/shared/layouts/main_wrapper.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

// Llave global
final GlobalKey<ScaffoldState> mainScaffoldKey = GlobalKey<ScaffoldState>();

final appRouter = GoRouter(
  initialLocation: '/',
  navigatorKey: _rootNavigatorKey,

  routes: [
    // Rutas que llevan al envoltorio principal y opciones del drawer
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainWrapper(navigationShell: navigationShell);
      },
      branches: [
        // Rama Home
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/',
              builder: (context, state) => const HomeScreen(),
              routes: [
                // Subruta dinamica para el detalle de cualquier categoria
                GoRoute(
                  parentNavigatorKey: _rootNavigatorKey,
                  path: 'concepts/:id',
                  builder: (context, state) {
                    final conceptId = state.pathParameters['id']!;

                    final category = conceptsList.firstWhere(
                      (item) => item.id == conceptId,
                      orElse: () => conceptsList.first,
                    );

                    return CategoryDetailScreen(category: category);
                  },
                )
              ]
            )
          ]
        ),

        // Rama Project 1
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/examples',
              builder: (context, state) => const ExamplesScreen(),
            )
          ]
        ),

        // Rama Demos
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/demo/project-one',
              builder: (context, state) => const PresentationInstaFeed(),
            ),
            GoRoute(
              path: '/demo/project-two', 
              builder: (context, state) => const PresentationTaskFlow(),
            )
          ]
        ),

        // Rama Ajustes
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/settings',
              builder: (context, state) => const SettingsScreen(),
            )
          ]
        )
      ]
    ),

    // Todo lo que este aqui fuera sera pantalla completa:
    // Navegacion para la demo InstaFeed
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return InstaLayout(navigationShell: navigationShell);
      },
      branches: [
        // Rama 1: Feed principal
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/insta-feed',
              builder: (context, state) => const FeedScreen(),
            ),
          ]
        ),
        // Rama 2: Búsqueda (SliverGrid)
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/insta-search',
              builder: (context, state) => const SearchScreen(),
            ),
          ],
        ),
        // Rama 3: Perfil
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/insta-profile',
              builder: (context, state) => const ProfileScreen(),
            ),
          ],
        ),
      ]
    ),
    
  ]
);