import 'package:flutter/material.dart';

import '../models/NeoWsData.dart';
import '../ui/pages/terms_and_conditions_screen.dart';
 // Asegúrate de importar tu modelo
import 'package:flutter/material.dart';


class NeoWsDataWidget extends StatelessWidget {
  final NeoWsData data;

  NeoWsDataWidget(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Asteroides Cercanos a la Tierra'),
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
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => TermsAndConditionsScreen(),
              ));
            },
          ),
        ],
        titleTextStyle: TextStyle(
          fontFamily: 'Exo',
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 24.0,
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Container(
        color: Colors.black,
        padding: EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            buildListTile('Número de elementos', data.elementCount?.toString() ?? "No disponible"),
            buildListTile('Enlace siguiente', data.links?.next ?? "No disponible"),
            buildListTile('Enlace anterior', data.links?.prev ?? "No disponible"),
            buildListTile('Enlace propio', data.links?.self ?? "No disponible"),
            if (data.nearEarthObjects != null)
              for (var dateKey in data.nearEarthObjects!.keys)
                Theme(
                  data: ThemeData(
                    dividerColor: Colors.blue[900],
                    expansionTileTheme: ExpansionTileThemeData(
                      backgroundColor: Colors.blue[900],
                      iconColor: Colors.white,
                      collapsedIconColor: Colors.white,
                      collapsedBackgroundColor: Colors.blue[900],
                      textColor: Colors.white,
                      collapsedTextColor: Colors.white,
                    ),
                  ),
                  child: ExpansionTile(
                    title: Text(
                      'Fecha: $dateKey',
                      style: TextStyle(
                        fontFamily: 'Exo',
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    children: data.nearEarthObjects![dateKey]!.map<Widget>((neo) {
                      bool isPotentiallyHazardous = neo.isPotentiallyHazardousAsteroid != null && neo.isPotentiallyHazardousAsteroid!;
                      Color textColor = isPotentiallyHazardous ? Colors.red : Colors.white;

                      return Container(
                        color: Colors.blueGrey,
                        child: ListTile(
                          title: Text(
                            'Nombre del objeto cercano a la Tierra: ${neo.name ?? "No disponible"}',
                            style: TextStyle(
                              fontFamily: 'Exo',
                              fontWeight: FontWeight.bold,
                              color: textColor,
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('ID NEO: ${neo.id ?? "No disponible"}', style: TextStyle(color: textColor)),
                              Text('URL NASA JPL: ${neo.nasaJplUrl ?? "No disponible"}', style: TextStyle(color: textColor)),
                              Text('Magnitud absoluta H: ${neo.absoluteMagnitudeH?.toString() ?? "No disponible"}', style: TextStyle(color: textColor)),
                              Text('Diámetro estimado (km): ${neo.estimatedDiameter?.kilometers?.estimatedDiameterMin?.toString() ?? "No disponible"} - ${neo.estimatedDiameter?.kilometers?.estimatedDiameterMax?.toString() ?? "No disponible"} km', style: TextStyle(color: textColor)),
                              Text('Es objeto centinela: ${neo.isSentryObject != null ? (neo.isSentryObject! ? "Sí" : "No") : "No disponible"}', style: TextStyle(color: textColor)),
                              Text('Es potencialmente peligroso: ${isPotentiallyHazardous ? "Sí" : "No"}', style: TextStyle(color: textColor)),
                              for (var approach in neo.closeApproachData ?? [])
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text('Fecha de acercamiento: ${approach.closeApproachDate ?? "No disponible"}', style: TextStyle(color: textColor)),
                                ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
          ],
        ),
      ),
    );
  }

  Widget buildListTile(String title, String value) {
    return ListTile(
      title: Text(
        '$title: $value',
        style: TextStyle(
          fontFamily: 'Exo',
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
