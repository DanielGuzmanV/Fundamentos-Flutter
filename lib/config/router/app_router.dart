import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:fundamentos_flutter/features/features_exports.dart';
import 'package:fundamentos_flutter/shared/widgets/main_wrapper.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

// Llave global
final GlobalKey<ScaffoldState> mainScaffoldKey = GlobalKey<ScaffoldState>();

final appRouter = GoRouter(
  initialLocation: '/',
  navigatorKey: _rootNavigatorKey,

  routes: [
    // Rutas que llevan al envoltorio principal
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainWrapper(navigationShell: navigationShell);
      },
      branches: [
        // Rama 1: home (solo esta el Drawer)
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/',
              builder: (context, state) => const HomeScreen(),
            )
          ]
        ),

        // Rama: Proyecto 1
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/examples',
              builder: (context, state) => const ExamplesScreen(),
            ),
          ],
        ),

        // Rama: Demos (Esta tendra las Tabs)
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/demo/project-one',
              builder: (context, state) => const ProjectOneScreen(),
            ),
            GoRoute(
              path: '/demo/project-two',
              builder: (context, state) => const ProjectTwoScreen(),
            ),
          ]
        ),


        // Rama: Ajustes
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/settings',
              builder: (context, state) => const SettingsScreen(),
            ),
          ],
        ),
      ]
    ),

    // Todo lo que este aqui fuera sera pantalla completa:
  ]
);