import 'package:flutter/material.dart';

class AsteroidesCercanos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Asteroides Cercanos'),
      ),
      body: Center(
        child: Text('Aquí se mostrarán los asteroides cercanos.'),
      ),
    );
  }
}