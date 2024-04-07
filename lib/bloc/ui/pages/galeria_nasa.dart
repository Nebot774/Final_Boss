import 'package:flutter/material.dart';

class GaleriaNasa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Galería NASA'),
      ),
      body: Center(
        child: Text('Aquí se mostrarán las imágenes y vídeos de la NASA.'),
      ),
    );
  }
}