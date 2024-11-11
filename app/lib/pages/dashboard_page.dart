import 'package:flutter/material.dart';
import 'settings_page.dart';
import 'reports_page.dart';
import 'about_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List<String> detectedThreats = [];

  @override
  void initState() {
    super.initState();
    fetchThreats();
  }

  // Função para buscar ameaças da API (simulação)
  Future<void> fetchThreats() async {
    try {
      final response =
          await http.get(Uri.parse('https://api.example.com/threats'));
      if (response.statusCode == 200) {
        // Suponha que a resposta seja uma lista de ameaças
        setState(() {
          detectedThreats = List<String>.from(json.decode(response.body));
        });
      }
    } catch (e) {
      print("Erro ao buscar ameaças: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NetWatch - Dashboard'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SettingsPage()),
            ),
          ),
          IconButton(
            icon: Icon(Icons.report),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ReportsPage()),
            ),
          ),
          IconButton(
            icon: Icon(Icons.info),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AboutPage()),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: detectedThreats.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(detectedThreats[index]),
          );
        },
      ),
    );
  }
}
