import 'package:flutter/material.dart';
import 'package:tarea_6/servicios/servicio_clima.dart';

class ClimaRD extends StatefulWidget {
  const ClimaRD({super.key});

  @override
  _ClimaRDState createState() => _ClimaRDState();
}

class _ClimaRDState extends State<ClimaRD> {
  String _clima = '';

  @override
  void initState() {
    super.initState();
    _obtenerClima();
  }

  Future<void> _obtenerClima() async {
    final clima = await ServicioClima.obtenerClima();
    setState(() {
      _clima = clima;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clima en República Dominicana'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _clima.isNotEmpty ? _clima : 'Cargando clima...',
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _obtenerClima,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Actualizar Clima'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

