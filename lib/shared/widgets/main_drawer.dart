import 'package:flutter/material.dart';
import 'package:fundamentos_flutter/config/router/app_routes_data.dart';

class MainDrawer extends StatelessWidget {
  final List<AppRouteItem> menuItems;
  final Function(int) onDestinationSelected;

  const MainDrawer({
    super.key, 
    required this.menuItems,
    required this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) {
    // Ancho de la pantalla
    final sizeScreen = MediaQuery.of(context).size;

    return Drawer(
      width: sizeScreen.width * 0.7,
      backgroundColor: Colors.grey.shade50,
      child: SafeArea(
        child: Column(
          children: [
            // Titulo del drawer:
            Padding(
              padding: const EdgeInsets.fromLTRB(16,20,16,8,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Menu principal',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.of(context).pop(),
                  )
                ],
              )
            ),

            ...menuItems.map((item) {
              final index = menuItems.indexOf(item);
              return _DrawerItem(
                icon: item.icon, 
                label: item.label, 
                onTap: () => onDestinationSelected(index)
              );
            }),

            const Spacer(),
            const Divider(),

            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Cerrar Sesión'),
              onTap:() => print('Cerrar sesioin de la app'),
            )
          ],
        )
      ),
    );
  }
}

class _DrawerItem extends ListTile {
  _DrawerItem({
    required IconData icon, 
    required String label,
    required VoidCallback onTap,
  }) : super(leading: Icon(icon), title: Text(label), onTap: onTap);
}