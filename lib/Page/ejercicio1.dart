import 'package:flutter/material.dart';

class Ejercicio1 extends StatelessWidget {
  Ejercicio1({super.key});

  final TextEditingController _ageController = TextEditingController();
  String _message = "";

  void _calculateCategory(BuildContext context) {
    final ageText = _ageController.text;
    int? age = int.tryParse(ageText);

    // Validación de entrada
    if (age == null || age < 0) {
      // Mostrar mensaje de error si no es un número válido
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Por favor, ingrese una edad válida"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Determinación de la categoría según la edad
    if (age <= 10) {
      _message = "NIÑO";
    } else if (age > 10 && age <= 14) {
      _message = "PUBER";
    } else if (age > 14 && age <= 18) {
      _message = "ADOLESCENTE";
    } else if (age > 18 && age <= 25) {
      _message = "JOVEN";
    } else if (age > 25 && age <= 65) {
      _message = "ADULTO";
    } else {
      _message = "ANCIANO";
    }

    // Actualizar la interfaz para mostrar el resultado
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Categoría: $_message"),
        backgroundColor: Colors.blue,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicio 1'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            // Agrega la imagen aquí
            Image.asset(
              'assets/images/ejercicio1.jpg', // Asegúrate de que la ruta sea correcta
              width: 300,
              height: 300,
            ),
            const Text(
              'Ingrese la edad para determinar la categoría:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _ageController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Edad',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _calculateCategory(context),
              child: const Text('Determinar Categoría'),
            ),
          ],
        ),
      ),
    );
  }
}
