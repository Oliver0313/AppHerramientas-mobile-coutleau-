import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PrediccionGenero extends StatefulWidget {
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
          _genero = data['gender'];
        });
      } else {
        throw Exception('Error al cargar datos');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Predicción de Género'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                onChanged: (value) {
                  _nombre = value;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Ingresa un nombre',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _predecirGenero,
                child: Text('Predecir Género'),
              ),
              SizedBox(height: 20),
              if (_genero != null) 
                Text(
                  'Género: $_genero',
                  style: TextStyle(fontSize: 24),
                ),
            ],
          ),
        ),
      ),
    );
  }
}





