import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/threat.dart';

class ThreatListPage extends StatefulWidget {
  @override
  _ThreatListPageState createState() => _ThreatListPageState();
}

class _ThreatListPageState extends State<ThreatListPage> {
  late Future<List<Threat>>
      futureThreats; // Declaração da variável que armazenará as ameaças

  @override
  void initState() {
    super.initState();
    futureThreats = ApiService()
        .fetchThreats(); // Chama a função da ApiService para buscar as ameaças
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista de Ameaças')), // Título da página
      body: FutureBuilder<List<Threat>>(
        future: futureThreats, // Passa o Future para o FutureBuilder
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child:
                    CircularProgressIndicator()); // Exibe carregando enquanto busca os dados
          } else if (snapshot.hasError) {
            return Center(
                child:
                    Text('Erro: ${snapshot.error}')); // Exibe erro, caso ocorra
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
                child:
                    Text('Nenhuma ameaça encontrada')); // Caso não haja dados
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length, // Número de itens na lista
              itemBuilder: (context, index) {
                final threat =
                    snapshot.data![index]; // Obtém a ameaça para cada item
                return ListTile(
                  title: Text(threat.name), // Exibe o nome da ameaça
                  subtitle:
                      Text(threat.description), // Exibe a descrição da ameaça
                  trailing: Text(threat.dateDetected
                      .toString()), // Exibe a data de detecção
                );
              },
            );
          }
        },
      ),
    );
  }
}
