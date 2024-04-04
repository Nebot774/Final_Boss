import 'package:flutter/material.dart';

class ImagenDelDia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Imagen del Día'),
      ),
      body: Center(
        child: Text('Aquí se mostrará la imagen del día.'),
      ),
    );
  }
}