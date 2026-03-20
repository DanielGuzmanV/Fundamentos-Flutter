import 'package:flutter/material.dart';
import 'package:fundamentos_flutter/config/router/app_router.dart';
import 'package:go_router/go_router.dart';

class MainWrapper extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainWrapper({
    super.key,
    required this.navigationShell
  });

  // Metodo para cambiar de rama
  void _goToBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  // Helper para cerrar y luego navegar
  void _closeDrawerAndGo(BuildContext context, int index) {
    Navigator.of(context).pop();
    Future.microtask(() => _goToBranch(index));
  }

  @override
  Widget build(BuildContext context) {
    final isConcepsBranch = navigationShell.currentIndex == 1;

    return Scaffold(
      key: mainScaffoldKey,
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [

                    // Titulo del drawer:
                    const Padding(
                      padding: EdgeInsets.fromLTRB(16,20,16,8,), // 40 arriba para que no pegue con la barra de estado
                      child: Text(
                        'Menu principal',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                    ),

                    // Opcion Inicio
                    ListTile(
                      leading: const Icon(Icons.home),
                      title: const Text('Inicio'),
                      onTap: () => _closeDrawerAndGo(context, 0),
                    ),

                    // Opcion de conceptos
                    ListTile(
                      leading: const Icon(Icons.book),
                      title: const Text('Conceptos'),
                      onTap: () => _closeDrawerAndGo(context, 1),
                    ),

                    // Opcion de ejemplos
                    ListTile(
                      leading: const Icon(Icons.code),
                      title: const Text('Ejemplos'),
                      onTap: () => _closeDrawerAndGo(context, 2),
                    ),

                    // Opcion de pruebas
                    ListTile(
                      leading: const Icon(Icons.bug_report),
                      title: const Text('Pruebas'),
                      onTap: () => _closeDrawerAndGo(context, 3),
                    ),

                    // Opcion para uso de APIs
                    ListTile(
                      leading: const Icon(Icons.settings),
                      title: const Text('Ajustes'),
                      onTap: () => _closeDrawerAndGo(context, 4),
                    ),
                  ],
                )
              ),

              // Opcion para cerrar la sesion
              const Divider(),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Cerrar Sesión'),
                onTap: () {
                  // Aquí irá la lógica de Riverpod
                  Navigator.of(context).pop();
                },
              ),
              const SizedBox(height: 10,)
            ],
          ),
          
        ),
      ),

      body: navigationShell,

      bottomNavigationBar: isConcepsBranch
        ? BottomNavigationBar(
            currentIndex: _getSelectedIndex(
                GoRouter.of(context).routeInformationProvider.value.uri.path,
              ),
            onTap: (index) {
              // Aquí manejamos la navegación interna de las tabs de conceptos
              if (index == 0) context.go('/concepts/basic');
              if (index == 1) context.go('/concepts/intermediate');
              if (index == 2) context.go('/concepts/advanced');
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.star_outline), label: 'Básico'),
              BottomNavigationBarItem(icon: Icon(Icons.star_half), label: 'Intermedio'),
              BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Avanzado'),
            ],
          )
        : null,
    );
  }

  // Ayudante para saber qué tab iluminar basado en la URL
  int _getSelectedIndex(String location) {
    if (location.contains('intermediate')) return 1;
    if (location.contains('advanced')) return 2;
    return 0;
  }
}