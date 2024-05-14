import 'package:flutter/material.dart';

import '../models/NeoWsData.dart';
import '../ui/pages/terms_and_conditions_screen.dart';


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
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Número de elementos: ${data.elementCount?.toString() ?? "No disponible"}'),
          ),
          ListTile(
            title: Text('Enlace siguiente: ${data.links?.next ?? "No disponible"}'),
          ),
          ListTile(
            title: Text('Enlace anterior: ${data.links?.prev ?? "No disponible"}'),
          ),
          ListTile(
            title: Text('Enlace propio: ${data.links?.self ?? "No disponible"}'),
          ),
          if (data.nearEarthObjects != null)
            for (var dateKey in data.nearEarthObjects!.keys)
              ExpansionTile(
                title: Text('Fecha: $dateKey'),
                children: data.nearEarthObjects![dateKey]!.map<Widget>((neo) {
                  return ListTile(
                    title: Text('Nombre del objeto cercano a la Tierra: ${neo.name ?? "No disponible"}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('ID NEO: ${neo.id ?? "No disponible"}'),
                        Text('URL NASA JPL: ${neo.nasaJplUrl ?? "No disponible"}'),
                        Text('Magnitud absoluta H: ${neo.absoluteMagnitudeH?.toString() ?? "No disponible"}'),
                        Text('Diámetro estimado (km): ${neo.estimatedDiameter?.kilometers?.estimatedDiameterMin?.toString() ?? "No disponible"} - ${neo.estimatedDiameter?.kilometers?.estimatedDiameterMax?.toString() ?? "No disponible"} km'),
                        Text('Es objeto centinela: ${neo.isSentryObject != null ? (neo.isSentryObject! ? "Sí" : "No") : "No disponible"}'),
                        Text('Es potencialmente peligroso: ${neo.isPotentiallyHazardousAsteroid != null ? (neo.isPotentiallyHazardousAsteroid! ? "Sí" : "No") : "No disponible"}'),
                        for (var approach in neo.closeApproachData ?? [])
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text('Fecha de acercamiento: ${approach.closeApproachDate ?? "No disponible"}'),
                          ),
                      ],
                    ),
                  );
                }).toList(),
              ),
        ],
      ),
    );
  }
}
