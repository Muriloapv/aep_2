import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  double alertSensitivity = 1.0;

  @override
  void initState() {
    super.initState();
    loadSettings();
  }

  // Função para carregar configurações salvas
  Future<void> loadSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      alertSensitivity = prefs.getDouble('alertSensitivity') ?? 1.0;
    });
  }

  // Função para salvar configuração de sensibilidade
  Future<void> saveSettings(double value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('alertSensitivity', value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Configurações')),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('Sensibilidade do Alerta'),
          ),
          Slider(
            value: alertSensitivity,
            min: 0.0,
            max: 2.0,
            divisions: 4,
            onChanged: (value) {
              setState(() {
                alertSensitivity = value;
              });
              saveSettings(value);
            },
          ),
        ],
      ),
    );
  }
}
