import 'dart:async';
import 'package:flutter/material.dart';
import 'package:final_boss/ui/pages/terms_and_conditions_screen.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> images = [
    'assets/imagenes/i_home/foratNegre.png',
    'assets/imagenes/i_home/jupi.png',
    'assets/imagenes/i_home/nebulosa.png',
    'assets/imagenes/i_home/quintetoGalaxias.png',
  ];

  int _currentIndex = Random().nextInt(4); // Genera un número aleatorio entre 0 y 3
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 10), (Timer timer) {
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
          Center( // Añade el widget Center aquí
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 15), // Reduce este valor para disminuir el espacio
                // Añade aquí tu logo si tienes uno
                Image.asset(
                  'assets/imagenes/i_home/logo_Nasa.png',
                  height: MediaQuery.of(context).size.height * 0.2,
                ), // Ajusta la ruta y tamaño según necesites
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 34.0, vertical: 8.0),
                  child: Text(
                    'Explora el Espacio con la NASA',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Exo',
                      fontSize: 34,
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(1.0, 1.0),
                          blurRadius: 3.0,
                          color: Color.fromARGB(150, 0, 0, 0),
                        ),
                        Shadow(
                          offset: Offset(1.0, 1.0),
                          blurRadius: 8.0,
                          color: Color.fromARGB(125, 0, 0, 0),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red, // Color rojo para el botón
                      onPrimary: Colors.white, // Color blanco para el texto
                    ),
                    onPressed: () {
                      // Navega a TermsAndConditionsScreen cuando se toque el botón
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TermsAndConditionsScreen()),
                      );
                    },
                    child: Text(
                      'Explorar',
                      style: TextStyle(
                        fontFamily: 'Exo',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                // Agrega más widgets según sea necesario
              ],
            ),
          ),
        ],
      ),
    );
  }
}
