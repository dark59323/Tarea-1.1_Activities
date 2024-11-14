import 'package:flutter/material.dart';
import 'Page/ejercicio1.dart';
import 'Page/ejercicio2.dart';
import 'Page/ejercicio3.dart';
import 'Page/ejercicio4.dart';
import 'Page/ejercicio5.dart';
import 'Page/ejercicio6.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
      routes: {
        '/ejercicio1': (context) => Ejercicio1(),
        '/ejercicio2': (context) => Ejercicio2(),
        '/ejercicio3': (context) => Ejercicio3(),
        '/ejercicio4': (context) => Ejercicio4(),
        '/ejercicio5': (context) => Ejercicio5(),
        '/ejercicio6': (context) => Ejercicio6()
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EJERCICIOS PLANTEADOS'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menú de Ejercicios',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.computer),
              title: const Text('Ejercicio 1'),
              onTap: () {
                Navigator.pop(context); // Cierra el Drawer
                Navigator.pushNamed(context, '/ejercicio1');
              },
            ),
            ListTile(
              leading: const Icon(Icons.computer),
              title: const Text('Ejercicio 2'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/ejercicio2');
              },
            ),
            ListTile(
              leading: const Icon(Icons.computer),
              title: const Text('Ejercicio 3'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/ejercicio3');
              },
            ),
            ListTile(
              leading: const Icon(Icons.computer),
              title: const Text('Ejercicio 4'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/ejercicio4');
              },
            ),
            ListTile(
              leading: const Icon(Icons.computer),
              title: const Text('Ejercicio 5'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/ejercicio5');
              },
            ),
            ListTile(
              leading: const Icon(Icons.computer),
              title: const Text('Ejercicio 6'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/ejercicio6');
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            // Agrega la imagen aquí
            Image.asset(
              'assets/images/espelogo.png', // Asegúrate de que la ruta sea correcta
              width: 150,
              height: 150,
            ),
            const Text(
              'UNIVERSIDAD DE LAS FUERZAS ARMADAS',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const Text(
              'ESPE',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Text(
              'APLICACIONES MOVILES',
              style: TextStyle(fontSize: 25),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Text(
              'DANNY QUINGALUISA & KARLA CAJAS',
              style: TextStyle(fontSize: 30),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
