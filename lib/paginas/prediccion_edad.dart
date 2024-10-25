import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PrediccionEdad extends StatefulWidget {
  @override
  _PrediccionEdadState createState() => _PrediccionEdadState();
}

class _PrediccionEdadState extends State<PrediccionEdad> {
  String? _nombre;
  int? _edad;
  String _mensaje = '';

  void _predecirEdad() async {
    if (_nombre != null && _nombre!.isNotEmpty) {
      final response = await http.get(Uri.parse('https://api.agify.io/?name=$_nombre'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          _edad = data['age'];
          if (_edad != null) {
            if (_edad! < 30) {
              _mensaje = 'Eres joven';
            } else if (_edad! < 60) {
              _mensaje = 'Eres adulto';
            } else {
              _mensaje = 'Eres anciano';
            }
          }
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
        title: Text('Predicción de Edad'),
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
                onPressed: _predecirEdad,
                child: Text('Predecir Edad'),
              ),
              SizedBox(height: 20),
              if (_edad != null) ...[
                Text('Edad: $_edad', style: TextStyle(fontSize: 24)),
                Text(_mensaje, style: TextStyle(fontSize: 20)),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

