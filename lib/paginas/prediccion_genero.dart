import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PrediccionGenero extends StatefulWidget {
  const PrediccionGenero({super.key});

  @override
  _PrediccionGeneroState createState() => _PrediccionGeneroState();
}

class _PrediccionGeneroState extends State<PrediccionGenero> {
  String? _nombre;
  String? _genero;

  void _predecirGenero() async {
    if (_nombre != null && _nombre!.isNotEmpty) {
      final response = await http.get(Uri.parse('https://api.genderize.io/?name=$_nombre'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          // Cambia "male" y "female" a "masculino" y "femenino"
          _genero = data['gender'] == 'male' ? 'masculino' : 'femenino';
        });
      } else {
        throw Exception('Error al cargar datos');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Cambia el color de fondo según el género
    Color backgroundColor;
    if (_genero == 'masculino') {
      backgroundColor = Colors.blue; // Azul para masculino
    } else if (_genero == 'femenino') {
      backgroundColor = Colors.pink; // Rosa para femenino
    } else {
      backgroundColor = Colors.white; // Fondo blanco si no se ha predicho
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Predicción de Género'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        color: backgroundColor, // Color de fondo
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  onChanged: (value) {
                    _nombre = value;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Ingresa un nombre',
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _predecirGenero,
                  child: const Text('Predecir Género'),
                ),
                const SizedBox(height: 20),
                if (_genero != null) 
                  Text(
                    'Género: $_genero',
                    style: const TextStyle(fontSize: 24),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}






