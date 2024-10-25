import 'package:http/http.dart' as http;
import 'dart:convert';

class ServicioGenero {
  static Future<String> predecirGenero(String nombre) async {
    final url = 'https://api.genderize.io/?name=$nombre';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['gender'];
    } else {
      throw Exception('Error al predecir el género');
    }
  }
}
