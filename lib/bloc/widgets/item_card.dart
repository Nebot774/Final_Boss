import 'package:flutter/material.dart';
import 'package:final_boss/bloc/models/item.dart';
import 'package:final_boss/bloc/animations/rotation_y_transition.dart';
import 'dart:math';
import 'dart:async';
import 'package:flutter/material.dart';

class ItemCard extends StatefulWidget {
  final Item item;
  final Widget destinationPage;

  ItemCard({required this.item, required this.destinationPage});

  @override
  _ItemCardState createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  Timer? _timer; // Declarar _timer como nulo

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer?.cancel(); // Cancelar el timer cuando el widget sea desechado
    super.dispose();
  }

  void _flipCard() {
    setState(() {
      if (_controller.isDismissed) {
        _controller.forward();
        _startTimer();
      } else {
        _controller.reverse();
        _timer?.cancel(); // Cancelar el timer si se vuelve a girar manualmente
      }
    });
  }

  void _startTimer() {
    _timer = Timer(Duration(seconds: 10), () {
      if (mounted && !_controller.isDismissed) {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _flipCard,
      child: AnimatedBuilder(
          animation: _controller,
          builder: (_, child) {
            final angle = _controller.value * pi;
            final transform = Matrix4.rotationY(angle);
            if (_controller.value > 0.5) {
              transform.setEntry(3, 2, 0.001); // Ajuste de perspectiva
              transform.rotateY(pi);
            }
            return Transform(
              transform: transform,
              alignment: Alignment.center,
              child: _controller.value <= 0.5 ? buildFrontSide(widget.item) : buildBackSide(widget.item),
            );
          }
      ),
    );
  }

  Widget buildFrontSide(Item item) {
    double screenWidth = MediaQuery.of(context).size.width; // Obtén el ancho de la pantalla

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double thirtyPercentHeight = constraints.maxHeight * 0.12; // Calcula el 30% de la altura total

        return Container(
          key: ValueKey(true), // Clave única para la parte frontal
          width: screenWidth,
          child: Column(
            children: [
              Expanded(
                child: AnimatedSwitcher(
                  duration: Duration(seconds: 1),
                  transitionBuilder: (Widget child, Animation<double> animation) {
                    return RotationYTransition(rotationY: animation, child: child);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(item.imagePath), // Imagen del item
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: thirtyPercentHeight, // Asigna el 30% de la altura total al contenedor
                width: double.infinity, // Ocupa todo el ancho disponible
                decoration: BoxDecoration(
                  color: Color(0xFFFF0000), // fondo de color rojjo
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: Center( // Alinea el texto al centro
                  child: Text(
                    item.name,
                    style: TextStyle(
                      fontFamily: 'Exo',
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // texto de color blanco
                      fontSize: 24.0, // Aumenta el tamaño del texto
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildBackSide(Item item) {
    double screenWidth = MediaQuery.of(context).size.width; // Obtén el ancho de la pantalla
    return Container(
      key: ValueKey(false), // Clave única para la parte trasera
      width: screenWidth, // Asigna el ancho de la pantalla al ancho del contenedor
      decoration: BoxDecoration(
        color: Colors.black, // Un color de fondo para la parte trasera, para distinguirla
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center( // Alinea el texto al centro
              child: Text(
                item.description, // Descripción del item
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Exo',
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(2.0, 2.0),
                      blurRadius: 3.0,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    Shadow(
                      offset: Offset(2.0, 2.0),
                      blurRadius: 8.0,
                      color: Color.fromARGB(125, 0, 0, 255),
                    ),
                  ],
                ), // Aumenta el tamaño de la letra y cambia la fuente a 'Exo Bold'
                textAlign: TextAlign.center, // Alinea el texto al centro
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => widget.destinationPage));
            },
            style: ElevatedButton.styleFrom(primary: Colors.red), // Color del botón
            child: Text('Explorar', style: TextStyle(fontFamily: 'Exo', fontWeight: FontWeight.bold, color: Colors.white)), // Cambia la fuente a 'Exo Bold' y el color a blanco
          ),
        ],
      ),
    );
  }
}