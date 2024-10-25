import 'package:http/http.dart' as http;
import 'dart:convert';

class ServicioUniversidades {
  static Future<List<dynamic>> buscarUniversidades(String pais) async {
    final url = 'http://universities.hipolabs.com/search?country=$pais';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Error al buscar universidades');
    }
  }
}