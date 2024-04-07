import 'package:flutter/material.dart';
import 'package:final_boss/bloc/ui/pages/terms_and_conditions_screen.dart';
import 'package:flutter/material.dart';
import 'package:final_boss/bloc/models/item.dart';
import 'package:flutter/material.dart';
import 'package:final_boss/bloc/models/ItemDestination.dart';
import 'package:final_boss/bloc/widgets/item_card.dart';
import 'package:final_boss/bloc/ui/pages/imagen_del_dia.dart';
import 'package:final_boss/bloc/ui/pages/asteroides_cercanos.dart';
import 'package:final_boss/bloc/ui/pages/mars_rovers.dart';
import 'package:final_boss/bloc/ui/pages/galeria_nasa.dart';
import 'package:final_boss/bloc/ui/pages/tierra_desde_espacio.dart';
import 'package:final_boss/bloc/ui/pages/dia_cumple.dart';


class MenuPage extends StatelessWidget {
  final List<ItemDestination> itemsWithDestinations = [
    ItemDestination(
      item: Item(
        imagePath: 'assets/imagenes/i_menu/i_dia.png',
        name: 'Imagen del dia',
        description: 'Descubre la belleza del cosmos con la Imagen Astronómica del Día, traída directamente desde la NASA a tu pantalla',
      ),
      destinationPage: ImagenDelDia(),
    ),
    ItemDestination(
      item: Item(
        imagePath: 'assets/imagenes/i_menu/asteroidecer.png',
        name: 'Asteroides Cercanos a la Tierra',
        description: 'Explora los asteroides que orbitan cerca de nuestro planeta, con datos actualizados sobre sus tamaños, velocidades y distancias',
      ),
      destinationPage: AsteroidesCercanos(),
    ),
    ItemDestination(
      item: Item(
        imagePath: 'assets/imagenes/i_menu/mrover.png',
        name: 'Mar Rovers en Marte ',
        description: 'Viaja a Marte desde tu dispositivo y explora las últimas fotos capturadas por los rovers Curiosity, Opportunity y Spirit',
      ),
      destinationPage: MarsRovers(),
    ),
    ItemDestination(
      item: Item(
        imagePath: 'assets/imagenes/i_menu/astronauta.png',
        name: 'Galería de Imágenes y Vídeos de la NASA',
        description: 'Navega por una vasta colección de impresionantes imágenes y videos espaciales de la NASA, actualizada constantemente',
      ),
      destinationPage: GaleriaNasa(),
    ),
    ItemDestination(
      item: Item(
        imagePath: 'assets/imagenes/i_menu/tierra.png',
        name: 'Imágenes de la Tierra desde el Espacio',
        description: 'Observa nuestro planeta desde una perspectiva única con las últimas imágenes de la Tierra tomadas desde el espacio',
      ),
      destinationPage: TierraDesdeEspacio(),
    ),
    ItemDestination(
      item: Item(
        imagePath: 'assets/imagenes/i_menu/satu.png',
        name: 'Imagen del Día de tu Cumpleaños',
        description: 'Encuentra y maravíllate con la Imagen Astronómica del Día de la NASA correspondiente a tu fecha de nacimiento',
      ),
      destinationPage: DiaCumple(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black, // fondo de color negro
      child: Scaffold(
        backgroundColor: Colors.transparent, // Hace que el fondo del Scaffold sea transparente
        appBar: AppBar(
          title: Padding(
            padding: EdgeInsets.only(left: 60.0), // Añade margen a la izquierda del título
            child: Text(
              'Menu',
              style: TextStyle(
                fontFamily: 'Exo',
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 24.0,
              ),
            ),
          ),
          backgroundColor: Colors.blue[900], // Cambia el color de fondo de la AppBar a azul
          actions: <Widget>[
            IconButton(
              icon: Text(
                'T.C',
                style: TextStyle(
                  fontFamily: 'Exo',
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Color blanco para el texto
                  fontSize: 24.0, // Aumenta el tamaño del texto
                ),
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => TermsAndConditionsScreen(),
                ));
              },
            ),
          ],
          automaticallyImplyLeading: false, // Esto quita el botón de retroceder
        ),
        body: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: itemsWithDestinations.length,
          itemBuilder: (context, index) {
            final itemDestination = itemsWithDestinations[index];
            return GestureDetector(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => itemDestination.destinationPage,
              )),
              child: ItemCard(
                item: itemDestination.item,
                destinationPage: itemDestination.destinationPage,
              ),
            );
          },
        ),
      ),
    );
  }
}
