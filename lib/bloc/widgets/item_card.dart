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
    return Container(
      key: ValueKey(true), // Clave única para la parte frontal
      width: 160.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(item.imagePath), // Imagen del item
        ),
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Text(item.name, style: TextStyle(fontFamily: 'Exo', fontWeight: FontWeight.bold)), // Nombre del item
      ),
    );
  }

  Widget buildBackSide(Item item) {
    return Container(
      key: ValueKey(false), // Clave única para la parte trasera
      width: 160.0,
      decoration: BoxDecoration(
        color: Colors.blueGrey, // Un color de fondo para la parte trasera, para distinguirla
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              item.description, // Descripción del item
              style: TextStyle(color: Colors.white, fontFamily: 'Exo'),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => widget.destinationPage));
            },
            style: ElevatedButton.styleFrom(primary: Colors.red), // Color del botón
            child: Text('Explorar', style: TextStyle(fontFamily: 'Exo')),
          ),
        ],
      ),
    );
  }
}