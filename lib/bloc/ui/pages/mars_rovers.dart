import 'package:flutter/material.dart';

class MarsRovers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mars Rovers'),
      ),
      body: Center(
        child: Text('Aquí se mostrarán los Mars Rovers.'),
      ),
    );
  }
}