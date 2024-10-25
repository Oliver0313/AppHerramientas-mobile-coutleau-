import 'package:http/http.dart' as http;
import 'dart:convert';

class ServicioEdad {
  static Future<int?> predecirEdad(String nombre) async {
    final url = 'https://api.agify.io/?name=$nombre';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['age'] as int?;
    } else {
      return null; // En caso de error, retornamos null
    }
  }
}