import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String apiKey =
      'YOUR_API_KEY'; // Substitua 'YOUR_API_KEY' pelo seu token da API
  final String baseUrl =
      'https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash-latest:generateContent';

  // Função para enviar o texto para a API Google Gemini
  Future<Map<String, dynamic>> generateContent(String text) async {
    final url = Uri.parse('$baseUrl?key=$apiKey');

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              'Bearer $apiKey', // Adiciona o token de autorização no cabeçalho, se necessário
        },
        body: json.encode({
          'contents': [
            {
              'parts': [
                {'text': text}
              ]
            }
          ]
        }),
      );

      if (response.statusCode == 200) {
        return json.decode(response.body); // Retorna o conteúdo gerado pela API
      } else {
        throw Exception(
            'Erro ao gerar conteúdo: ${response.statusCode} - ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Erro na requisição: $e');
    }
  }
}
