import 'package:flutter/material.dart';
import 'package:final_boss/bloc/ui/pages/terms_and_conditions_screen.dart';
import 'package:final_boss/bloc/models/ItemRover.dart';
import 'package:final_boss/bloc/ui/pages/rovers/curiosity/curiosityRover.dart';
import 'package:final_boss/bloc/ui/pages/rovers/opportunity/opportunityRover.dart';
import 'package:final_boss/bloc/ui/pages/rovers/spirit/spiritRover.dart';
import 'package:final_boss/bloc/widgets/item_card_rover.dart';

class MarsRovers extends StatelessWidget {
  final List<ItemRover> rovers = [
    ItemRover(
      imagePath: 'assets/imagenes/i_rovers_menu/curiosity_real_menu.jpg', // Asegúrate de tener esta imagen en tu carpeta de assets
      name: 'Curiosity',
      destinationPage: CuriosityPage(), // Widget de la página de destino para Curiosity
    ),
    ItemRover(
      imagePath: 'assets/imagenes/i_rovers_menu/opportunity_real_menu.jpg', // Asegúrate de tener esta imagen en tu carpeta de assets
      name: 'Opportunity',
      destinationPage: OpportunityPage(), // Widget de la página de destino para Opportunity
    ),
    ItemRover(
      imagePath: 'assets/imagenes/i_rovers_menu/spirit_real_menu.jpg', // Asegúrate de tener esta imagen en tu carpeta de assets
      name: 'Spirit',
      destinationPage: SpiritPage(), // Widget de la página de destino para Spirit
    ),
    // Añade más rovers si lo deseas
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white), // Cambia el color del icono a blanco
        title: Padding(
          padding: EdgeInsets.only(left: 0.0), // Añade margen a la izquierda del título
          child: Text(
            'Mar Rovers en Marte',
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
      ),
      body: Container(
        color: Colors.black, // Cambia el color de fondo a negro
        child: ListView.builder(
          scrollDirection: Axis.horizontal, // Añade esta línea para hacer que la lista se desplace horizontalmente
          itemCount: rovers.length,
          itemBuilder: (context, index) {
            return ItemCardRover(itemRover: rovers[index]);
          },
        ),
      ),
    );
  }
}