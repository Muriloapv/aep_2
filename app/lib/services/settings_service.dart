import 'package:shared_preferences/shared_preferences.dart';

class SettingsService {
  // Salvar a configuração de sensibilidade
  Future<void> saveSensitivity(double sensitivity) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('sensitivity', sensitivity);
  }

  // Carregar a configuração de sensibilidade
  Future<double> loadSensitivity() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getDouble('sensitivity') ?? 0.5; // Sensibilidade padrão de 0.5
  }
}
