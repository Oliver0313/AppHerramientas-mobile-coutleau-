import 'package:http/http.dart' as http;
import 'dart:convert';

class ServicioWordpress {
  static Future<List<dynamic>> obtenerNoticias() async {
    const url = 'https://dev.to/api/articles';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return []; 
    }
  }
}
