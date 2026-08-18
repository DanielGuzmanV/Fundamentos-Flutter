import 'package:flutter/material.dart';
import 'package:fundamentos_flutter/config/data/concept_data.dart';
import 'package:fundamentos_flutter/config/router/app_routes_data.dart';
import 'package:fundamentos_flutter/features/home/presentation/screens/category_detail_screen.dart';
import 'package:fundamentos_flutter/features/home/presentation/screens/topic_detail_screen.dart';
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
              name: AppRoutes.home,
              path: AppRoutes.homePath,
              builder: (context, state) => const HomeScreen(),
              routes: [
                // Subruta dinamica para el detalle de cualquier categoria
                GoRoute(
                  name: AppRoutes.categoryDetail,
                  parentNavigatorKey: _rootNavigatorKey,
                  path: AppRoutes.categoryDetailPath,
                  builder: (context, state) {
                    final conceptId = state.pathParameters['id']!;

                    final category = conceptsList.firstWhere(
                      (item) => item.id == conceptId,
                      orElse: () => conceptsList.first,
                    );

                    return CategoryDetailScreen(category: category);
                  },
                  // Subrutas dinamicas para el tema especifico
                  routes: [
                    GoRoute(
                      name: AppRoutes.topicDetail,
                      parentNavigatorKey: _rootNavigatorKey,
                      path: AppRoutes.topicDetailPath,
                      builder: (context, state) {
                        final conceptId = state.pathParameters['id']!;
                        final topicId = state.pathParameters['topicId'];

                        // Se busca la categoria
                        final category = conceptsList.firstWhere(
                          (item) => item.id == conceptId,
                          orElse: () => conceptsList.first,
                        );

                        // Se busca el topic dentro de esa categoria
                        final topic = category.topics.firstWhere(
                          (item) => item.id == topicId,
                          orElse: () => category.topics.first,
                        );

                        return TopicDetailScreen(
                          category: category,
                          topic: topic,
                        );
                      },
                    )
                  ]
                )
              ]
            )
          ]
        ),

        // Rama Project 1
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: AppRoutes.examples,
              path: AppRoutes.examplesPath,
              builder: (context, state) => const ExamplesScreen(),
            )
          ]
        ),

        // Rama Demos
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: AppRoutes.projectOneDemo,
              path: AppRoutes.projectOneDemoPath,
              builder: (context, state) => const PresentationInstaFeed(),
            ),
            GoRoute(
              name: AppRoutes.projectTwoDemo,
              path: AppRoutes.projectTwoDemoPath, 
              builder: (context, state) => const PresentationTaskFlow(),
            )
          ]
        ),

        // Rama Ajustes
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: AppRoutes.settings,
              path: AppRoutes.settingsPath,
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