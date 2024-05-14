import 'package:flutter/material.dart';
import '../models/NeoWsNeoData.dart';
import '../ui/pages/terms_and_conditions_screen.dart';


class NeoWsNeoDataWidget extends StatelessWidget {
  final NeoWsNeoData data;

  NeoWsNeoDataWidget(this.data);

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
            buildListTile('ID', data.id),
            buildListTile('Referencia NEO ID', data.neoReferenceId),
            buildListTile('Nombre', data.name),
            buildListTile('URL NASA JPL', data.nasaJplUrl),
            buildListTile('Magnitud absoluta H', data.absoluteMagnitudeH?.toString()),
            if (data.estimatedDiameter != null)
              buildListTile(
                  'Diámetro estimado (km)',
                  'Min: ${data.estimatedDiameter!.kilometers?.estimatedDiameterMin?.toString() ?? "No disponible"} - Max: ${data.estimatedDiameter!.kilometers?.estimatedDiameterMax?.toString() ?? "No disponible"}'
              ),
            buildListTile('Es objeto centinela', data.isSentryObject != null ? (data.isSentryObject! ? "Sí" : "No") : "No disponible"),
            buildListTile('Es potencialmente peligroso', data.isPotentiallyHazardousAsteroid != null ? (data.isPotentiallyHazardousAsteroid! ? "Sí" : "No") : "No disponible"),
            buildListTile('Enlace propio', data.links?.self),
            if (data.closeApproachData != null)
              ...data.closeApproachData!.map((approach) =>
                  buildListTile(
                      'Fecha de aproximación cercana',
                      '${approach.closeApproachDate ?? "No disponible"}\nVelocidad relativa (km/h): ${approach.relativeVelocity?.kilometersPerHour?.toString() ?? "No disponible"}\nDistancia de paso (km): ${approach.missDistance?.kilometers?.toString() ?? "No disponible"}',
                      isSubtitle: true
                  )
              ).toList(),
          ],
        ),
      ),
    );
  }

  Widget buildListTile(String title, String? value, {bool isSubtitle = false}) {
    return DefaultTextStyle(
      style: TextStyle(
        color: Colors.white,
        fontFamily: 'Exo',
        fontWeight: FontWeight.bold,
        fontSize: isSubtitle ? 16.0 : 18.0,
      ),
      child: ListTile(
        title: Text('$title: ${value ?? "No disponible"}'),
        subtitle: isSubtitle ? Text(value ?? "No disponible") : null,
      ),
    );
  }
}
