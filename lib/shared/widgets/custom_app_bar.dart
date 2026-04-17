import 'package:flutter/material.dart';
// import 'package:fundamentos_flutter/config/router/app_router.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;

  const CustomAppBar({super.key, required this.title, this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: actions,
      // leading: IconButton(
      //   icon: const Icon(Icons.menu),
      //   onPressed: () => mainScaffoldKey.currentState?.openDrawer(),
      // ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}