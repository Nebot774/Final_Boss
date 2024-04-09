import 'package:flutter/material.dart';

class InformationOpportunity extends StatelessWidget {
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
                  'Opportunity',
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
                'El Opportunity fue uno de los dos rovers de la misión Mars Exploration Rover de la NASA, junto con su gemelo, el Spirit. Estos rovers fueron diseñados para moverse por la superficie marciana y realizar investigaciones geológicas. Opportunity aterrizó en la región de Meridiani Planum, cerca del ecuador de Marte, una zona donde previas observaciones orbitales sugerían la presencia de minerales que se forman en agua.',
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
                children: <Widget>[
                  Text(
                    '-Buscar y caracterizar una variedad de rocas y suelos que pudieran contener evidencia de la acción del agua en el pasado.',
                    style: TextStyle(
                      fontFamily: 'Exo',
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 8.0), // Espacio entre los elementos de la lista
                  Text(
                    '-Determinar la distribución y composición de minerales, rocas y suelos alrededor del lugar de aterrizaje.',
                    style: TextStyle(
                      fontFamily: 'Exo',
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    '-Buscar indicios de condiciones ambientales pasadas que habrían sido capaces de sostener vida microbiana.',
                    style: TextStyle(
                      fontFamily: 'Exo',
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    '-Investigar las características geológicas de Marte que pudieran revelar el proceso de formación y erosión del planeta rojo.',
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
                'Opportunity utilizó una combinación de paracaídas, cohetes de frenado y airbags para aterrizar con seguridad en la superficie de Marte. El lugar de aterrizaje fue seleccionado basado en su potencial científico para estudios geológicos y su seguridad para el aterrizaje. Este método de aterrizaje "rebotando" fue una técnica innovadora que permitió un aterrizaje seguro sin la necesidad de un sistema de aterrizaje propulsado.',
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
                'Inicialmente planeada para durar 90 días marcianos (sol), la misión de Opportunity se extendió repetidamente, permitiéndole operar por casi 15 años hasta que se perdió el contacto en junio de 2018, tras una intensa tormenta de polvo en Marte. El último intento de comunicación con Opportunity fue el 10 de febrero de 2019, después de lo cual la NASA declaró el fin de la misión.',
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
                    '1. Evidencia de Agua: Opportunity proporcionó pruebas contundentes de que hubo agua líquida en el pasado de Marte, al encontrar minerales como hematitas y sulfatos que se forman en presencia de agua.',
                    style: TextStyle(
                      fontFamily: 'Exo',
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 8.0), // Espacio entre los elementos de la lista
                  Text(
                    '2. Condiciones Habitables: Descubrió indicios de que las condiciones en Marte podrían haber sido habitables en algún momento, incluyendo la identificación de arcilla y otros minerales que se forman en ambientes acuosos no ácidos.',
                    style: TextStyle(
                      fontFamily: 'Exo',
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    '3. Meteoritos: Opportunity también encontró varios meteoritos en la superficie de Marte, incluyendo el primer meteorito de hierro descubierto en otro planeta.',
                    style: TextStyle(
                      fontFamily: 'Exo',
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    '4. Historia Geológica: A través de sus análisis, el rover pudo reconstruir parte de la historia geológica y climática de Marte, ofreciendo una visión de los cambios ambientales a lo largo de miles de millones de años.',
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
