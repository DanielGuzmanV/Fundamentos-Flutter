import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  final Function(int) onDestinationSelected;

  const MainDrawer({super.key, required this.onDestinationSelected});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            
            // Titulo del drawer:
            const Padding(
              padding: EdgeInsets.fromLTRB(16,20,16,8,),
              child: Text(
                'Menu principal',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),

            _DrawerItem(
              icon: Icons.home, 
              label: 'Inicio', 
              onTap: () => onDestinationSelected(0),
            ),
            _DrawerItem(
              icon: Icons.code, 
              label: 'Proyecto 1', 
              onTap: () => onDestinationSelected(1),
            ),
            _DrawerItem(
              icon: Icons.drive_file_rename_outline_sharp, 
              label: 'Demos tecnicas', 
              onTap: () => onDestinationSelected(2),
            ),
            _DrawerItem(
              icon: Icons.home, 
              label: 'Ajustes', 
              onTap: () => onDestinationSelected(3),
            ),

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