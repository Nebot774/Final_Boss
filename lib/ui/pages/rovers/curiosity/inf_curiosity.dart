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
                  'assets/imagenes/i_rovers_menu/curiosity_menu.png', // Asegúrate de tener esta imagen en tus assets
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
                'Curiosity es el rover más grande y avanzado enviado a Marte hasta la fecha. Lleva a bordo un conjunto sofisticado de instrumentos científicos diseñados para llevar a cabo una exploración en detalle del ambiente marciano. El rover fue lanzado desde la Tierra el 26 de noviembre de 2011 y aterrizó en Marte el 6 de agosto de 2012. Su destino, el cráter Gale, fue elegido debido a su interesante geología y evidencia de agua pasada.',
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '-Determinar la naturaleza y la cantidad de materia orgánica.',
                    style: TextStyle(
                      fontFamily: 'Exo',
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 8.0), // Espacio entre los elementos de la lista
                  Text(
                    '-Estudiar los procesos geológicos y la historia del agua en Marte.',
                    style: TextStyle(
                      fontFamily: 'Exo',
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    '-Investigar la atmósfera marciana, especialmente en lo que respecta a la búsqueda de vida',
                    style: TextStyle(
                      fontFamily: 'Exo',
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    '-Caracterizar la radiación en la superficie marciana',
                    style: TextStyle(
                      fontFamily: 'Exo',
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                ],
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
                'El aterrizaje de Curiosity fue un hito técnico, utilizando el complejo sistema "Sky Crane" para posarse suavemente en la superficie marciana. Este sistema, que nunca antes se había utilizado, implicó el uso de un cohete grúa que bajó al rover al suelo mediante cables, permitiendo un aterrizaje preciso en una región de interés científico.',
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
                'Proceso de la Misión',
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
                'Desde su llegada, Curiosity ha estado navegando por la superficie de Marte, llevando a cabo una serie de experimentos científicos. Sus instrumentos le permiten analizar muestras de suelo y roca, medir la radiación, estudiar la atmósfera, y mucho más. El rover opera de manera autónoma, tomando decisiones sobre la navegación y la selección de objetivos científicos, con instrucciones enviadas desde la Tierra por los controladores de la misión.',
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '1. Evidencia de Agua Pasada: Curiosity ha encontrado pruebas claras de que en el cráter Gale hubo ríos y lagos con agua dulce y condiciones químicas que podrían haber sido favorables para la vida microbiana.',
                    style: TextStyle(
                      fontFamily: 'Exo',
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 8.0), // Espacio entre los elementos de la lista
                  Text(
                    '2. Materia Orgánica: El rover ha detectado moléculas orgánicas complejas en rocas sedimentarias, que son los bloques de construcción básicos de la vida, sugiriendo que las condiciones en Marte podrían haber sostenido vida en el pasado.',
                    style: TextStyle(
                      fontFamily: 'Exo',
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    '3. Ciclos de Metano: Las mediciones de metano en la atmósfera de Marte indican variaciones estacionales, lo que sugiere una fuente activa de metano, aunque su origen sigue siendo un misterio.',
                    style: TextStyle(
                      fontFamily: 'Exo',
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    '4. Radiación: Curiosity ha medido los niveles de radiación en la superficie marciana, proporcionando datos cruciales para futuras misiones tripuladas a Marte.',
                    style: TextStyle(
                      fontFamily: 'Exo',
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),

            // Repite la estructura de Padding + Text para "Aterrizaje", "Duración de la Misión" y "Principales Descubrimientos"
          ],
        ),
      ),
    );
  }
}
