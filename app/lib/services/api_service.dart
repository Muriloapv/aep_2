import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/threat.dart';

class ApiService {
  final String baseUrl =
      'https://jsonplaceholder.typicode.com'; // API de teste, altere para sua URL real

  // Função para buscar ameaças
  Future<List<Threat>> fetchThreats() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/posts'));

      // Verifica o código de status da resposta
      if (response.statusCode == 200) {
        // Se a resposta for bem-sucedida, mapeia o JSON para a lista de objetos Threat
        List<dynamic> data = json.decode(response.body);
        return data.map((json) => Threat.fromJson(json)).toList();
      } else {
        // Caso a resposta não seja 200, lança uma exceção
        throw Exception('Falha ao carregar ameaças');
      }
    } catch (e) {
      // Em caso de erro, lança uma exceção
      throw Exception('Erro na requisição: $e');
    }
  }
}
