import 'package:flutter/material.dart';

class FormCardSection extends StatefulWidget {
  const FormCardSection({super.key});

  @override
  State<FormCardSection> createState() => _FormCardSectionState();
}

class _FormCardSectionState extends State<FormCardSection> {
  String userName = '';
  bool isNotificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Formulario de Perfil (Input + Estado)',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Escribe tu nombre',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                // Actualizamos el estado de la pantalla al escribir
                setState(() {
                  userName = value;
                });
              },
            ),
            const SizedBox(height: 12),
            SwitchListTile(
              title: const Text('Activar Notificaciones'),
              value: isNotificationsEnabled,
              onChanged: (value) {
                setState(() {
                  isNotificationsEnabled = value;
                });
              },
            ),
            const Divider(height: 24),
            Text(
              'Resultado en Vivo:\nUsuario: ${userName.isEmpty ? "(Sin nombre)" : userName}\nNotificaciones: ${isNotificationsEnabled ? "Sí" : "No"}',
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}