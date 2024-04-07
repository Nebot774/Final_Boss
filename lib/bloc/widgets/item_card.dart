import 'package:flutter/material.dart';
import 'package:final_boss/bloc/models/item.dart';
import 'package:final_boss/bloc/animations/rotation_y_transition.dart';

class ItemCard extends StatefulWidget {
  final Item item;
  final Widget destinationPage;

  ItemCard({required this.item, required this.destinationPage});

  @override
  _ItemCardState createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  bool isFront = true;

  void _flipCard() {
    setState(() {
      isFront = !isFront;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _flipCard, // Asigna la acción de voltear la tarjeta
      child: AnimatedSwitcher(
        duration: Duration(seconds: 1),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return RotationYTransition(rotationY: animation, child: child);
        },
        child: isFront ? buildFrontSide(widget.item) : buildBackSide(widget.item),
      ),
    );
  }

  Widget buildFrontSide(Item item) {
    double screenWidth = MediaQuery.of(context).size.width; // Obtén el ancho de la pantalla
    return Container(
      key: ValueKey(true), // Clave única para la parte frontal
      width: screenWidth,
      child: Column(
        children: [
          Expanded(
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
          Container(
            width: double.infinity, // Ocupa todo el ancho disponible
            decoration: BoxDecoration(
              color: Colors.blue[900], // fondo de color azul
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Text(
              item.name,
              style: TextStyle(
                fontFamily: 'Exo',
                fontWeight: FontWeight.bold,
                color: Colors.white, // texto de color blanco
              ),
            ),
          ),
        ],
      ),
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
                style: TextStyle(color: Colors.white, fontFamily: 'Exo', fontWeight: FontWeight.bold, fontSize: 20.0), // Aumenta el tamaño de la letra y cambia la fuente a 'Exo Bold'
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