import 'package:flutter/material.dart';
import 'package:final_boss/models/ItemRover.dart';

class ItemCardRover extends StatelessWidget {
  final ItemRover itemRover;

  ItemCardRover({required this.itemRover});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => itemRover.destinationPage),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          //top: MediaQuery.of(context).size.height * 0.05, // 10% de la altura de la pantalla
          //bottom: MediaQuery.of(context).size.height * 0.05, // 10% de la altura de la pantalla
        ),
        child: Container(
          width: MediaQuery.of(context).size.width, // Ocupa todo el ancho de la pantalla
          decoration: BoxDecoration(
            color: Colors.blue[900],
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(itemRover.imagePath),
            ),
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Color(0xFFFF0000),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              width: double.infinity,
              child: Text(
                itemRover.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Exo',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}