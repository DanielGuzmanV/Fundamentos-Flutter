import 'package:flutter/material.dart';
import 'package:fundamentos_flutter/config/router/app_router.dart';
import 'package:fundamentos_flutter/config/router/app_routes_data.dart';
import 'package:fundamentos_flutter/shared/utils/navigation_utils.dart';
import 'package:fundamentos_flutter/shared/widgets/custom_app_bar.dart';
import 'package:fundamentos_flutter/shared/widgets/main_bottom_nav.dart';
import 'package:fundamentos_flutter/shared/widgets/main_drawer.dart';
import 'package:go_router/go_router.dart';

class MainWrapper extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainWrapper({ super.key, required this.navigationShell });

  // Metodo para cambiar de rama
  void _onDestinationSelected(int index) {
    navigationShell.goBranch(
      index, 
      initialLocation: index == navigationShell.currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    final int index = navigationShell.currentIndex;
    final String location = GoRouter.of(context).routeInformationProvider.value.uri.path;
    final AppRouteItem currentRouteItem = mainNavigationItems[index];

    return Scaffold(
      key: mainScaffoldKey,

      // Delegamos el titulo a la utility
      appBar: CustomAppBar(title: currentRouteItem.label),

      // Delegamos el drawer 
      drawer: MainDrawer(
        menuItems: mainNavigationItems,
        onDestinationSelected: (idx) {
          Navigator.pop(context);
          _onDestinationSelected(idx);
      }),

      body: navigationShell,

      bottomNavigationBar: currentRouteItem.showBottomBar
        ? MainBottomNav(
            currentIndex: NavigationUtils.getBottomNavIndex(location), 
            onTabSelected: (idx) => NavigationUtils.handleBottomNavClick(context, idx)
          )
        : null
    );
  }
}