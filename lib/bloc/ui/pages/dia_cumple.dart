import 'package:flutter/material.dart';

class DiaCumple extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Día de Cumpleaños'),
      ),
      body: Center(
        child: Text('Aquí se mostrarán los detalles del día de cumpleaños.'),
      ),
    );
  }
}