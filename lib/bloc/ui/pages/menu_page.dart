import 'package:flutter/material.dart';
import 'package:final_boss/bloc/ui/pages/terms_and_conditions_screen.dart';
import 'package:flutter/material.dart';
import 'package:final_boss/bloc/models/item.dart';
import 'package:flutter/material.dart';
import 'package:final_boss/bloc/models/ItemDestination.dart';
import 'package:final_boss/bloc/widgets/item_card.dart';
import 'package:final_boss/bloc/ui/pages/imagen_del_dia.dart';

class MenuPage extends StatelessWidget {
  final List<ItemDestination> itemsWithDestinations = [
    ItemDestination(
      item: Item(
        imagePath: 'assets/imagenes/i_menu/i_dia.png',
        name: 'Imagen del dia',
        description: 'Aqui msotraremso la imagen astronomica mas relevante del dia de hoy',
      ),
      destinationPage: ImagenDelDia(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Menu')),
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
    );
  }
}
