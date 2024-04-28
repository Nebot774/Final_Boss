import 'package:flutter/material.dart';
import 'package:final_boss/ui/pages/terms_and_conditions_screen.dart';
import 'package:final_boss/models/ItemRover.dart';
import 'package:final_boss/ui/pages/rovers/curiosity/curiosityRover.dart';
import 'package:final_boss/ui/pages/rovers/opportunity/opportunityRover.dart';
import 'package:final_boss/ui/pages/rovers/spirit/spiritRover.dart';
import 'package:final_boss/widgets/item_card_rover.dart';
import 'package:flutter/foundation.dart' show kIsWeb;


class MarsRovers extends StatelessWidget {
  final List<ItemRover> rovers = [
    ItemRover(
      imagePath: 'assets/imagenes/i_rovers_menu/curiosity_real_menu.jpg',
      name: 'Curiosity',
      destinationPage: CuriosityPage(),
    ),
    ItemRover(
      imagePath: 'assets/imagenes/i_rovers_menu/opportunity_real_menu.jpg',
      name: 'Opportunity',
      destinationPage: OpportunityPage(),
    ),
    ItemRover(
      imagePath: 'assets/imagenes/i_rovers_menu/spirit_real_menu.jpg',
      name: 'Spirit',
      destinationPage: SpiritPage(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Mar Rovers en Marte',
          style: TextStyle(
            fontFamily: 'Exo',
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 24.0,
          ),
        ),
        backgroundColor: Colors.blue[900],
        actions: <Widget>[
          IconButton(
            icon: Text(
              'T.C',
              style: TextStyle(
                fontFamily: 'Exo',
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 24.0,
              ),
            ),
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => TermsAndConditionsScreen(),
            )),
          ),
        ],
      ),
      body: Container(
        color: Colors.black,
        child: Stack(
          children: <Widget>[
            ListView.builder(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: rovers.length,
              itemBuilder: (context, index) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  child: ItemCardRover(itemRover: rovers[index]),
                );
              },
            ),
            if (kIsWeb) ...[
              Positioned(
                left: 10,
                top: 0,
                bottom: 0,
                child: Center(
                  child: Container(
                    width: 48, // Tamaño adecuado para el botón
                    height: 48, // Tamaño adecuado para el botón
                    child: IconButton(
                      icon: Icon(Icons.arrow_back_ios, color: Colors.white54),
                      onPressed: () {
                        if (scrollController.hasClients && scrollController.offset > 0) {
                          scrollController.animateTo(
                            scrollController.offset - MediaQuery.of(context).size.width,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 10,
                top: 0,
                bottom: 0,
                child: Center(
                  child: Container(
                    width: 48, // Tamaño adecuado para el botón
                    height: 48, // Tamaño adecuado para el botón
                    child: IconButton(
                      icon: Icon(Icons.arrow_forward_ios, color: Colors.white54),
                      onPressed: () {
                        if (scrollController.hasClients && scrollController.offset < scrollController.position.maxScrollExtent) {
                          scrollController.animateTo(
                            scrollController.offset + MediaQuery.of(context).size.width,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                    ),
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
