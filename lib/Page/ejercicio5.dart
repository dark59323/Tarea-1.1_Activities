import 'package:flutter/material.dart';

class Ejercicio5 extends StatelessWidget {
  Ejercicio5({super.key});

  final TextEditingController _baseSalaryController = TextEditingController();
  final TextEditingController _salesController = TextEditingController();
  String _resultMessage = "";

  void _calculateMonthlySalary(BuildContext context) {
    final baseSalaryText = _baseSalaryController.text;
    final salesText = _salesController.text;

    // Validación de entrada
    double? baseSalary = double.tryParse(baseSalaryText);
    double? sales = double.tryParse(salesText);

    if (baseSalary == null || baseSalary < 0 || sales == null || sales < 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Por favor, ingrese valores válidos para el sueldo base y las ventas"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Cálculo de la comisión
    double commission = 0.0;
    if (sales >= 4000000 && sales < 10000000) {
      commission = sales * 0.03;
    } else if (sales >= 10000000) {
      commission = sales * 0.07;
    }

    // Cálculo del sueldo mensual total
    double monthlySalary = baseSalary + commission;

    // Mostrar el resultado
    _resultMessage = "Sueldo Base: \$${baseSalary.toStringAsFixed(2)}\n"
        "Ventas: \$${sales.toStringAsFixed(2)}\n"
        "Comisión: \$${commission.toStringAsFixed(2)}\n"
        "Sueldo Mensual: \$${monthlySalary.toStringAsFixed(2)}";

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
        title: const Text('Ejercicio 5'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            // Agrega la imagen aquí
            Image.asset(
              'assets/images/ejercicio5.jpg', // Asegúrate de que la ruta sea correcta
              width: 300,
              height: 300,
            ),
            const Text(
              'Ingrese el sueldo base y el monto de ventas del vendedor:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _baseSalaryController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Sueldo Base',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _salesController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Ventas',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _calculateMonthlySalary(context),
              child: const Text('Calcular Sueldo Mensual'),
            ),
          ],
        ),
      ),
    );
  }
}
