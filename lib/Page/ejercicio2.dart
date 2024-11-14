import 'package:flutter/material.dart';

class Ejercicio2 extends StatelessWidget {
  Ejercicio2({super.key});

  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  String _resultMessage = "";

  void _calculateTotal(BuildContext context) {
    final priceText = _priceController.text;
    final quantityText = _quantityController.text;

    // Validación de entrada
    double? price = double.tryParse(priceText);
    int? quantity = int.tryParse(quantityText);

    if (price == null || price <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Por favor, ingrese un precio válido"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (quantity == null || quantity <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Por favor, ingrese una cantidad válida"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Cálculo del descuento
    double discount = 0.0;
    if (quantity >= 3 && quantity <= 5) {
      discount = 0.10;
    } else if (quantity > 5) {
      discount = 0.20;
    }

    // Cálculo del precio total
    double subtotal = price * quantity;
    double discountAmount = subtotal * discount;
    double total = subtotal - discountAmount;

    // Mostrar el resultado
    _resultMessage =
    "Subtotal: \$${subtotal.toStringAsFixed(2)}\nDescuento: \$${discountAmount.toStringAsFixed(2)}\nTotal a Pagar: \$${total.toStringAsFixed(2)}";

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
        title: const Text('Ejercicio 2'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            // Agrega la imagen aquí
            Image.asset(
              'assets/images/ejercicio2.jpg', // Asegúrate de que la ruta sea correcta
              width: 300,
              height: 300,
            ),
            const Text(
              'Ingrese el precio unitario y la cantidad de camisas:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _priceController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Precio Unitario',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _quantityController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Cantidad de Camisas',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _calculateTotal(context),
              child: const Text('Calcular Total'),
            ),
          ],
        ),
      ),
    );
  }
}
