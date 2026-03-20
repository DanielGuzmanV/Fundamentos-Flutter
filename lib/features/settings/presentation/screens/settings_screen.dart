import 'package:flutter/material.dart';
import 'package:fundamentos_flutter/shared/widgets/custom_app_bar.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Ajustes'),
      body: Center(child: Text('Pantalla para los ajustes')),
    );
  }
}