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
import 'package:flutter/foundation.dart' show kIsWeb;

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();

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
}


class _MenuPageState extends State<MenuPage> {
  final ScrollController _scrollController = ScrollController();

  void _scrollToNextItem() {
    final screenWidth = MediaQuery.of(context).size.width;
    _scrollController.animateTo(
      _scrollController.offset + screenWidth,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _scrollToPreviousItem() {
    final screenWidth = MediaQuery.of(context).size.width;
    _scrollController.animateTo(
      _scrollController.offset - screenWidth,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width; // Obtén el ancho de la pantalla

    return Container(
      color: Colors.black,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Padding(
            padding: EdgeInsets.only(left: 60.0),
            child: Text('Menu', style: TextStyle(fontFamily: 'Exo', fontWeight: FontWeight.bold, color: Colors.white, fontSize: 24.0)),
          ),
          backgroundColor: Colors.blue[900],
          actions: <Widget>[
            IconButton(
              icon: Text('T.C', style: TextStyle(fontFamily: 'Exo', fontWeight: FontWeight.bold, color: Colors.white, fontSize: 24.0)),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => TermsAndConditionsScreen())),
            ),
          ],
          automaticallyImplyLeading: false,
        ),
        body: Stack(
          children: <Widget>[
            ListView.builder(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: widget.itemsWithDestinations.length,
              itemBuilder: (context, index) {
                final itemDestination = widget.itemsWithDestinations[index];
                return Container(
                  width: screenWidth, // Cada ítem tiene el ancho de la pantalla
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => itemDestination.destinationPage)),
                    child: ItemCard(
                      item: itemDestination.item,
                      destinationPage: itemDestination.destinationPage,
                    ),
                  ),
                );
              },
            ),
            if (kIsWeb) ...[
              Positioned(
                left: 10,
                top: 0,
                bottom: 0,
                child: Center(
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios, color: Colors.white54),
                    onPressed: _scrollToPreviousItem,
                  ),
                ),
              ),
              Positioned(
                right: 10,
                top: 0,
                bottom: 0,
                child: Center(
                  child: IconButton(
                    icon: Icon(Icons.arrow_forward_ios, color: Colors.white54),
                    onPressed: _scrollToNextItem,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}


