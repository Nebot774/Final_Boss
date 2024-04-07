import 'package:flutter/material.dart';
import 'bloc/ui/pages/home_page.dart'; // Asegúrate de que esta ruta de importación sea correcta
import 'package:final_boss/bloc/ui/pages/menu_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '', // Cambia esto al título de tu aplicación
      //home: HomePage(), // Redirige a HomePage al iniciar
      home: MenuPage() ,
    );
  }
}