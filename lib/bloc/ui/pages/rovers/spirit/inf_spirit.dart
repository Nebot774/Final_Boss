import 'package:flutter/material.dart';

class InformationSpirit extends StatelessWidget {
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
                  'Spirit',
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
                'Spirit fue diseñado para explorar la superficie de Marte y llevar a cabo investigaciones geológicas para comprender el pasado del planeta, especialmente en busca de evidencia sobre la presencia de agua. El lugar de aterrizaje fue el cráter Gusev, un sitio seleccionado por los científicos porque creían que había sido un lago en el pasado, lo que podría proporcionar valiosa información sobre la presencia de agua en Marte.',
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
                    '-Buscar y caracterizar una variedad de rocas y suelos que pudieran contener evidencia de la acción del agua en el pasado',
                    style: TextStyle(
                      fontFamily: 'Exo',
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 8.0), // Espacio entre los elementos de la lista
                  Text(
                    '-Determinar la distribución y composición de minerales, rocas y suelos alrededor del lugar de aterrizaje',
                    style: TextStyle(
                      fontFamily: 'Exo',
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    '-Investigar procesos que afectan la superficie de Marte, incluidos los efectos del agua y el viento',
                    style: TextStyle(
                      fontFamily: 'Exo',
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    '-Identificar y cuantificar los materiales geológicos en la superficie de Marte que podrían haber sostenido la vida',
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
                'Spirit utilizó una combinación de paracaídas, cohetes de frenado y bolsas de aire para aterrizar en Marte, similar a Opportunity. Este método permitió que el rover aterrizara de forma segura en el cráter Gusev, una zona que los científicos creían que había sido un lago, proporcionando un sitio rico en objetivos científicos para la misión',
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
                'La misión Spirit se diseñó originalmente para durar 90 soles (días marcianos), que equivalen a aproximadamente 92 días terrestres. Sin embargo, la misión superó todas las expectativas en términos de duración y rendimiento. Spirit continuó operando mucho más allá de su vida útil prevista, proporcionando datos valiosos desde su aterrizaje el 4 de enero de 2004 hasta que se perdió la comunicación en 2010.',
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
                children: <Widget>[
                  Text(
                    '1- Evidencia de Agua Pasada: Spirit encontró evidencia de que Marte tuvo un pasado húmedo, incluyendo descubrimientos de minerales como silicatos que se forman en presencia de agua.',
                    style: TextStyle(
                      fontFamily: 'Exo',
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 8.0), // Espacio entre los elementos de la lista
                  Text(
                    '2- Historia Geológica: El rover analizó diversas capas de roca y suelo, revelando parte de la compleja historia geológica y climática de Marte.',
                    style: TextStyle(
                      fontFamily: 'Exo',
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    '3- Condiciones Extremas: Spirit enfrentó condiciones extremas, como tormentas de polvo y frío intenso, que finalmente afectaron su movilidad y capacidad operativa, pero también proporcionaron datos sobre la durabilidad de las tecnologías en ambientes marcianos',
                    style: TextStyle(
                      fontFamily: 'Exo',
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    '4- Rocas Volcánicas: Descubrimientos de rocas ígneas sugirieron que el lugar de aterrizaje había experimentado actividad volcánica, lo que proporcionó información sobre los procesos geológicos de Marte.',
                    style: TextStyle(
                      fontFamily: 'Exo',
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    '5- "Home Plate": Una de las mayores contribuciones de Spirit fue el estudio de una formación rocosa conocida como "Home Plate", una estructura rica en sílice que sugiere que podría haber existido actividad geotermal en el pasado de Marte, lo cual tendría implicaciones importantes para la habitabilidad.',
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
