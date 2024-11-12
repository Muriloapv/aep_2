import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  // Lista de mensagens simuladas do chatbot
  final List<Map<String, String>> messages = [
    {"sender": "bot", "text": "Olá! Como posso ajudar você hoje?"},
    {"sender": "user", "text": "Quais são as ameaças recentes?"},
    {"sender": "bot", "text": "Atualmente, não há novas ameaças detectadas."},
    {"sender": "user", "text": "Como posso proteger meu sistema?"},
    {
      "sender": "bot",
      "text": "Recomendo manter seu sistema atualizado e usar uma senha forte."
    },
    {"sender": "user", "text": "Obrigado!"},
    {"sender": "bot", "text": "De nada! Estou aqui para ajudar."},
  ];

  final TextEditingController _controller = TextEditingController();

  // Função para adicionar uma nova mensagem
  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        // Adiciona a mensagem do usuário
        messages.add({"sender": "user", "text": _controller.text});

        // Limpa o campo de entrada de texto
        _controller.clear();

        // Adiciona uma resposta simulada do bot após o usuário enviar a mensagem
        messages
            .add({"sender": "bot", "text": "Esta é uma resposta automática."});
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NetWatch - Chatbot Simulado'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16.0),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                final isBot = message["sender"] == "bot";

                return Align(
                  alignment:
                      isBot ? Alignment.centerLeft : Alignment.centerRight,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    padding: EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: isBot ? Colors.grey[200] : Colors.blue[200],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Text(
                      message["text"]!,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Digite sua mensagem...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                IconButton(
                  icon: Icon(Icons.send),
                  color: Colors.blue,
                  onPressed: _sendMessage, // Chama a função de enviar mensagem
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
