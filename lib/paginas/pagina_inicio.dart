import 'package:flutter/material.dart';
import 'prediccion_genero.dart';
import 'prediccion_edad.dart';
import 'universidades.dart';
import 'clima_rd.dart';
import 'noticias_wordpress.dart';
import 'acerca_de.dart';

class PaginaInicio extends StatelessWidget {
  const PaginaInicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tarea 6 (Couteau)'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/imagenes/caja_herramientas.png', width: 150),
              const SizedBox(height: 20),
              const Text(
                'Bienvenido a mi Aplicación:)',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              const SizedBox(height: 20),
              _crearBoton(context, 'Predecir Género', const PrediccionGenero()),
              _crearBoton(context, 'Predecir Edad', const PrediccionEdad()),
              _crearBoton(context, 'Universidades por País', const Universidades()),
              _crearBoton(context, 'Clima en RD', const ClimaRD()),
              _crearBoton(context, 'Noticias WordPress', const NoticiasWordPress()),
              _crearBoton(context, 'Sobre Mí', const AcercaDe()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _crearBoton(BuildContext context, String texto, Widget pagina) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => pagina),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          textStyle: const TextStyle(fontSize: 18),
        ),
        child: Text(texto),
      ),
    );
  }
}
