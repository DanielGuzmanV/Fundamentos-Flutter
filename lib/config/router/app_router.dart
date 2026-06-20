import 'package:flutter/material.dart';
import 'package:fundamentos_flutter/config/router/app_routes_data.dart';
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
      branches: mainNavigationItems.map((item) {
        if(item.path == '/demo/project-one') {
          return StatefulShellBranch(
            routes: [
              GoRoute(
                path: item.path,
                builder: (context, state) => const PresentationInstaFeed(),
              ),
              GoRoute(
                path: '/demo/project-two',
                builder: (context, state) => const PresentationTaskFlow(),
              )
            ],
          );
        } else {
          return StatefulShellBranch(
            routes: [
              GoRoute(
                path: item.path,
                builder: (context, state) {
                  switch (item.path) {
                    case '/':
                      return const HomeScreen();
                    case '/examples':
                      return const ExamplesScreen();
                    case '/settings':
                      return const SettingsScreen();
                    default:
                      return const Text('Error: Pantalla no encontrada'); 
                  }
                },
              )
            ]
          );
        }
      }).toList()
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