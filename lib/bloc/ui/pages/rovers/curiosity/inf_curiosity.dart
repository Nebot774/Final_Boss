import 'package:flutter/material.dart';


// InformationCuriosity representa la vista de información para el rover Curiosity.
class InformationCuriosity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView( // Permite el desplazamiento vertical
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  'Curiosity',
                  style: TextStyle(
                    fontFamily: 'Exo',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 24.0,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Image.asset(
                  'assets/opportunity.jpg', // Asegúrate de tener esta imagen en tus assets
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Descripción',
                style: TextStyle(
                  fontFamily: 'Exo',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Aquí va una descripción larga del Opportunity Rover, incluyendo detalles interesantes sobre su misión y capacidades.',
                style: TextStyle(
                  fontFamily: 'Exo',
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Objetivos de la Misión',
                style: TextStyle(
                  fontFamily: 'Exo',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Los objetivos principales de la misión Opportunity...',
                style: TextStyle(
                  fontFamily: 'Exo',
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Aterrizaje',
                style: TextStyle(
                  fontFamily: 'Exo',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'aterrizaje',
                style: TextStyle(
                  fontFamily: 'Exo',
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Duracion de la Misión',
                style: TextStyle(
                  fontFamily: 'Exo',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Duracion de la Misión',
                style: TextStyle(
                  fontFamily: 'Exo',
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Principales Descubrimientos',
                style: TextStyle(
                  fontFamily: 'Exo',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Principales Descubrimientos',
                style: TextStyle(
                  fontFamily: 'Exo',
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
            ),

            // Repite la estructura de Padding + Text para "Aterrizaje", "Duración de la Misión" y "Principales Descubrimientos"
          ],
        ),
      ),
    );
  }
}
