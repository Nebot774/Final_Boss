import 'package:flutter/material.dart';
import 'bloc/ui/pages/home_page.dart'; // Asegúrate de que esta ruta de importación sea correcta

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '', // Cambia esto al título de tu aplicación
      home: HomePage(), // Redirige a HomePage al iniciar
    );
  }
}