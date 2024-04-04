import 'package:flutter/material.dart';
import 'package:final_boss/bloc/ui/pages/menu_page.dart'; // Asegúrate de que esta es la ruta correcta para tu archivo menu_page.dart

class TermsAndConditionsScreen extends StatelessWidget {
  void _onAccept(BuildContext context) {
    Navigator.of(context).push(
      // Navegar al fragmento o pantalla que desees
      MaterialPageRoute(builder: (context) => MenuPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Términos y Condiciones'),
        backgroundColor: Colors.black,
      ),
      body: Scrollbar(
        //isAlwaysShown: true, // Muestra la barra de desplazamiento siempre
        thickness: 6.0, // Grosor de la barra de desplazamiento
        radius: Radius.circular(10.0), // Bordes redondeados de la barra de desplazamiento
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black,
              border: Border.all(color: Color(0xFFCD7F32)), // Color bronce para el borde
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Términos y Condiciones',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Exo',
                    ),
                  ),

                  SizedBox(height: 16.0),
                  Text(
                    'Resumen:',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Exo',
                    ),
                  ),
                  SizedBox(height: 16.0), // Añade un espacio entre los textos
                  Text(
                    'Esta aplicación, "Explora el Espacio con la NASA", ha sido creada por Adrià Nebot Clemente, estudiante del 2º año del ciclo formativo de grado superior en Desarrollo de Aplicaciones Multiplataforma (DAM), como proyecto final. Este documento detalla los términos bajo los cuales los usuarios pueden utilizar la aplicación, haciendo hincapié en los aspectos más importantes para garantizar una experiencia segura y educativa.',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Exo',
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    '1. Aceptación de Términos:',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Exo',
                    ),
                  ),
                  SizedBox(height: 16.0), // Añade un espacio entre los textos
                  Text(
                    'Al acceder y utilizar "Explora el Espacio con la NASA", los usuarios aceptan estar vinculados por estos términos y condiciones. Si no estás de acuerdo con alguno de los términos presentados, te pedimos no utilizar la aplicación.',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Exo',
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    '2. Propósito Educativo:',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Exo',
                    ),
                  ),
                  SizedBox(height: 16.0), // Añade un espacio entre los textos
                  Text(
                    'El principal objetivo de esta aplicación es educativo. Pretende acercar el conocimiento espacial a personas de todas las edades, especialmente a los más jóvenes, de una manera accesible y estimulante, utilizando para ello datos y recursos proporcionados por las APIs de la NASA. Este proyecto no tiene fines comerciales y busca fomentar el interés y la educación en el ámbito de la astronomía y la ciencia espacial.',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Exo',
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    '3. Uso de APIs de la NASA:',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Exo',
                    ),
                  ),
                  SizedBox(height: 16.0), // Añade un espacio entre los textos
                  Text(
                    '"Explora el Espacio con la NASA" hace uso de diversas APIs proporcionadas por la NASA con el fin de acceder a información y recursos astronómicos actualizados. Todo el contenido obtenido a través de estas APIs se utiliza respetando los términos de uso establecidos por la NASA, garantizando así el respeto por la propiedad intelectual y la correcta utilización del material.',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Exo',
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    '4. Privacidad y Datos:',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Exo',
                    ),
                  ),
                  SizedBox(height: 16.0), // Añade un espacio entre los textos
                  Text(
                    'La aplicación "Explora el Espacio con la NASA" no recopila ni almacena datos personales de sus usuarios. Se garantiza una experiencia segura sin la necesidad de recabar información personal o sensible. Este enfoque subraya nuestro compromiso con la privacidad y la seguridad de nuestros usuarios.',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Exo',
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    '5. Contacto:',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Exo',
                    ),
                  ),
                  SizedBox(height: 16.0), // Añade un espacio entre los textos
                  Text(
                    'Para cualquier consulta o sugerencia relacionada con la aplicación, por favor, no dudes en ponerte en contacto a través del siguiente correo electrónico: adrianebot2@gmail.com. Estaremos encantados de recibir tus comentarios y trabajar en mejorar la aplicación.',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Exo',
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFFCD7F32), // Color bronce para el botón
                      ),
                      onPressed: () => _onAccept(context),
                      child: Text(
                        'Aceptar',
                        style: TextStyle(
                          fontFamily: 'Exo',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


