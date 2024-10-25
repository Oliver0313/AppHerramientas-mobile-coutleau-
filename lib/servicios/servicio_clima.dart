import 'package:http/http.dart' as http;
import 'dart:convert';

class ServicioClima {
  static Future<String> obtenerClima() async {
    const url = 'https://api.open-meteo.com/v1/forecast?latitude=18.5&longitude=-69.9&current_weather=true';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return 'Clima: ${data['current_weather']['temperature']}°C, ${data['current_weather']['weathercode']}';
    } else {
      throw Exception('Error al obtener el clima');
    }
  }
}