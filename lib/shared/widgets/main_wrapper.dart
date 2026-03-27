import 'package:flutter/material.dart';
import 'package:fundamentos_flutter/config/router/app_router.dart';
import 'package:fundamentos_flutter/shared/widgets/custom_app_bar.dart';
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

  // Función para determinar el título de la barra superior
  String getTitle() {
    switch (navigationShell.currentIndex) {
      case 0: return 'Inicio';
      case 1: return 'Ejemplos';
      case 2: return 'Explorar Demos';
      case 3: return 'Ajustes';
      default: return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final isConcepsBranch = navigationShell.currentIndex == 2;

    return Scaffold(
      key: mainScaffoldKey,

      appBar: CustomAppBar(title: getTitle()),

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

                    // Opcion del proyecto 1
                    ListTile(
                      leading: const Icon(Icons.code),
                      title: const Text('Ejemplos'),
                      onTap: () => _closeDrawerAndGo(context, 1),
                    ),

                    // Opcion de las demos
                    ListTile(
                      leading: const Icon(Icons.drive_file_rename_outline_sharp),
                      title: const Text('Demos tecnicas'),
                      onTap: () => _closeDrawerAndGo(context, 2),
                    ),

                    // Opcion para Ajustes
                    ListTile(
                      leading: const Icon(Icons.settings),
                      title: const Text('Ajustes'),
                      onTap: () => _closeDrawerAndGo(context, 3),
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
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.devices), label: 'Demo 1'),
              BottomNavigationBarItem(icon: Icon(Icons.devices_other_outlined), label: 'Demo 2'),
            ],
          )
        : null,
    );
  }

  // Ayudante para saber qué tab iluminar basado en la URL
  int _getSelectedIndex(String location) {
    if (location.contains('intermediate')) return 1;
    return 0;
  }
}