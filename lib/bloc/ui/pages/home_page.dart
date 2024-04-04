import 'dart:async';
import 'package:flutter/material.dart';
import 'package:final_boss/bloc/ui/pages/terms_and_conditions_screen.dart';
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
                  child: GestureDetector(
                    onTap: () {
                      // Navega a TermsAndConditionsScreen cuando se toque el botón
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TermsAndConditionsScreen()),
                      );
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.2, // Añade esta línea
                      width: MediaQuery.of(context).size.width * 0.2, // Añade esta línea
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/imagenes/i_home/luna_boton.png'), // Asegúrate de que esta es la ruta correcta para tu imagen de la luna
                          fit: BoxFit.contain, // Cambia esto a BoxFit.contain
                        ),
                      ),
                      child: Center( // Añade el widget Center aquí
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8.0, 4.0, 4.0, 8.0), // Cambia el padding aquí
                          child: Text(
                            '',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Exo',
                            ),
                          ),
                        ),
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
