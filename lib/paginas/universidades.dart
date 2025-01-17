import 'package:flutter/material.dart';
import 'package:tarea_6/servicios/servicio_universidades.dart';

class Universidades extends StatefulWidget {
  const Universidades({super.key});

  @override
  _UniversidadesState createState() => _UniversidadesState();
}

class _UniversidadesState extends State<Universidades> {
  final _controller = TextEditingController();
  List<dynamic> _universidades = [];

  Future<void> _buscarUniversidades(String pais) async {
    final universidades = await ServicioUniversidades.buscarUniversidades(pais);
    setState(() {
      _universidades = universidades;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buscar Universidades por País'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Ingresa el nombre del país en inglés',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.blueAccent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.blueAccent, width: 2),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.grey, width: 1),
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _buscarUniversidades(_controller.text);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent, 
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text('Buscar Universidades'),
            ),
            const SizedBox(height: 16), 
            Expanded(
              child: ListView.builder(
                itemCount: _universidades.length,
                itemBuilder: (context, index) {
                  final universidad = _universidades[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    elevation: 3, 
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      title: Text(
                        universidad['name'],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('Dominio: ${universidad['domains'][0]}'),
                      onTap: () {
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

