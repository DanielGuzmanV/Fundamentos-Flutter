import 'package:flutter/material.dart';
import 'package:fundamentos_flutter/shared/widgets/custom_app_bar.dart';

class TestsScreen extends StatelessWidget {
  const TestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Pruebas'),
      body: Center(child: Text('Pantalla para pruebas')),
    );
  }
}