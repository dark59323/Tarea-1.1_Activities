import 'package:flutter/material.dart';

class Ejercicio6 extends StatelessWidget {
  Ejercicio6({super.key});

  final TextEditingController _paltosController = TextEditingController();
  final TextEditingController _limonesController = TextEditingController();
  final TextEditingController _chirimoyosController = TextEditingController();
  String _resultMessage = "";

  void _calculateTotal(BuildContext context) {
    final paltosText = _paltosController.text;
    final limonesText = _limonesController.text;
    final chirimoyosText = _chirimoyosController.text;

    // Validación de entrada
    int? paltos = int.tryParse(paltosText);
    int? limones = int.tryParse(limonesText);
    int? chirimoyos = int.tryParse(chirimoyosText);

    if (paltos == null || paltos < 0 || limones == null || limones < 0 || chirimoyos == null || chirimoyos < 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Por favor, ingrese cantidades válidas de árboles"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Calcular el subtotal por tipo de árbol
    double totalPaltos = (paltos > 300)
        ? paltos * 1200 * (1 - 0.18)
        : (paltos > 100)
        ? paltos * 1200 * (1 - 0.10)
        : paltos * 1200;

    double totalLimones = (limones > 300)
        ? limones * 1000 * (1 - 0.20)
        : (limones > 100)
        ? limones * 1000 * (1 - 0.125)
        : limones * 1000;

    double totalChirimoyos = (chirimoyos > 300)
        ? chirimoyos * 980 * (1 - 0.19)
        : (chirimoyos > 100)
        ? chirimoyos * 980 * (1 - 0.145)
        : chirimoyos * 980;

    // Sumar el subtotal total
    double subtotal = totalPaltos + totalLimones + totalChirimoyos;
    int totalArboles = paltos + limones + chirimoyos;

    // Aplicar descuento adicional si la cantidad total de árboles supera 1000
    if (totalArboles > 1000) {
      subtotal *= (1 - 0.15);
    }

    // Calcular el IVA y el total a pagar
    double IVA = subtotal * 0.19;
    double totalConIVA = subtotal + IVA;

    // Mostrar el resultado
    _resultMessage =
    "Subtotal: \$${subtotal.toStringAsFixed(2)}\nIVA: \$${IVA.toStringAsFixed(2)}\nTotal a Pagar: \$${totalConIVA.toStringAsFixed(2)}";

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
        title: const Text('Ejercicio 6'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            // Agrega la imagen aquí
            Image.asset(
              'assets/images/ejercicio6.jpeg', // Asegúrate de que la ruta sea correcta
              width: 300,
              height: 300,
            ),
            const Text(
              'Ingrese la cantidad de árboles comprados para cada tipo:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _paltosController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Cantidad de Paltos',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _limonesController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Cantidad de Limones',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _chirimoyosController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Cantidad de Chirimoyos',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _calculateTotal(context),
              child: const Text('Calcular Total a Pagar'),
            ),
          ],
        ),
      ),
    );
  }
}
