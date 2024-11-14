import 'package:flutter/material.dart';

class Ejercicio3 extends StatelessWidget {
  Ejercicio3({super.key});

  final TextEditingController _aController = TextEditingController();
  final TextEditingController _bController = TextEditingController();
  final TextEditingController _cController = TextEditingController();
  String _resultMessage = "";

  void _checkPythagoreanTriple(BuildContext context) {
    final aText = _aController.text;
    final bText = _bController.text;
    final cText = _cController.text;

    // Validación de entrada
    int? a = int.tryParse(aText);
    int? b = int.tryParse(bText);
    int? c = int.tryParse(cText);

    if (a == null || b == null || c == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Por favor, ingrese valores enteros válidos para a, b y c"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Verificación de las condiciones para una terna pitagórica
    bool isPythagoreanTriple = (a * a + b * b == c * c) ||
        (a * a + c * c == b * b) ||
        (b * b + c * c == a * a);

    // Mostrar resultado
    _resultMessage = isPythagoreanTriple
        ? "Es una terna pitagórica"
        : "No es una terna pitagórica";

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(_resultMessage),
        backgroundColor: Colors.blue,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicio 3'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            // Agrega la imagen aquí
            Image.asset(
              'assets/images/ejercicio3.png', // Asegúrate de que la ruta sea correcta
              width: 300,
              height: 300,
            ),
            const Text(
              'Ingrese tres valores enteros para verificar si son una terna pitagórica:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _aController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Valor de a',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _bController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Valor de b',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _cController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Valor de c',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _checkPythagoreanTriple(context),
              child: const Text('Verificar Terna Pitagórica'),
            ),
          ],
        ),
      ),
    );
  }
}
