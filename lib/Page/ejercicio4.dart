import 'package:flutter/material.dart';

class Ejercicio4 extends StatelessWidget {
  Ejercicio4({super.key});

  final TextEditingController _consumptionController = TextEditingController();
  String _resultMessage = "";

  void _calculateBill(BuildContext context) {
    final consumptionText = _consumptionController.text;

    // Validación de entrada
    int? consumption = int.tryParse(consumptionText);

    if (consumption == null || consumption < 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Por favor, ingrese un consumo válido"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Variables de cálculo
    double total = 0.0;
    const double iva = 0.19;

    // Calcular el costo según el consumo
    if (consumption <= 50) {
      total = consumption * 30;
    } else if (consumption <= 100) {
      total = (50 * 30) + ((consumption - 50) * 35);
    } else {
      total = (50 * 30) + (50 * 35) + ((consumption - 100) * 42);
    }

    // Calcular el IVA
    double impuesto = total * iva;
    double totalConIVA = total + impuesto;

    // Mostrar el resultado
    _resultMessage =
    "Consumo: $consumption KWH\nSubtotal: \$${total.toStringAsFixed(2)}\nIVA: \$${impuesto.toStringAsFixed(2)}\nTotal a Pagar: \$${totalConIVA.toStringAsFixed(2)}";

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
        title: const Text('Ejercicio 4'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            // Agrega la imagen aquí
            Image.asset(
              'assets/images/ejercicio4.jpg', // Asegúrate de que la ruta sea correcta
              width: 300,
              height: 300,
            ),
            const Text(
              'Ingrese el consumo en KWH para calcular la tarifa:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _consumptionController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Consumo en KWH',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _calculateBill(context),
              child: const Text('Calcular Total a Pagar'),
            ),
          ],
        ),
      ),
    );
  }
}
