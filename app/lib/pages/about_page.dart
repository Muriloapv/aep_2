import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sobre NetWatch')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'NetWatch é um app de monitoramento de segurança em redes, '
          'usando IA para detectar atividades suspeitas e alertar usuários em tempo real.',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
