import 'dart:async';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> images = [
    'assets/imagenes/i_home/foratNegre.png',
    'assets/imagenes/i_home/jupi.png',
    'assets/imagenes/i_home/nebulosa.png',
    'assets/imagenes/i_home/quintetoGalaxias.png'
  ];

  int _currentIndex = 0;
  Timer? _timer; // Declarar _timer como nulo

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % images.length;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          AnimatedSwitcher(
            duration: Duration(seconds: 1),
            child: Image.asset(
              images[_currentIndex],
              key: ValueKey<int>(_currentIndex),
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          // Aquí va el contenido de tu página encima de la imagen de fondo
        ],
      ),
    );
  }
}