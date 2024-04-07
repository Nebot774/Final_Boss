import 'package:flutter/material.dart';

class TierraDesdeEspacio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tierra Desde Espacio'),
      ),
      body: Center(
        child: Text('Aquí se mostrarán las imágenes de la Tierra desde el espacio.'),
      ),
    );
  }
}