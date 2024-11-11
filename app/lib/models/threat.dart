class Threat {
  final String id;
  final String name;
  final String description;
  final DateTime dateDetected;

  Threat({
    required this.id,
    required this.name,
    required this.description,
    required this.dateDetected,
  });

  // Construtor para criar um objeto Threat a partir de JSON
  factory Threat.fromJson(Map<String, dynamic> json) {
    return Threat(
      id: json['id']
          .toString(), // Certifique-se de que o tipo de 'id' esteja correto
      name: json['title'], // Exemplo de uso, ajuste conforme necessário
      description: json['body'], // Exemplo de uso, ajuste conforme necessário
      dateDetected: DateTime.tryParse(json['dateDetected'] ?? '') ??
          DateTime.now(), // Trata a data corretamente
    );
  }
}
