import 'package:flutter/material.dart';
import '../models/NeoWsNeoData.dart';
import '../ui/pages/terms_and_conditions_screen.dart';


class NeoWsNeoDataWidget extends StatefulWidget {
  final NeoWsNeoData data;

  NeoWsNeoDataWidget(this.data);

  @override
  _NeoWsNeoDataWidgetState createState() => _NeoWsNeoDataWidgetState();
}

class _NeoWsNeoDataWidgetState extends State<NeoWsNeoDataWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    bool isPotentiallyHazardous = widget.data.isPotentiallyHazardousAsteroid != null && widget.data.isPotentiallyHazardousAsteroid!;
    Color textColor = isPotentiallyHazardous ? Colors.red : Colors.white;

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
            buildListTile('ID', widget.data.id, textColor),
            buildListTile('Referencia NEO ID', widget.data.neoReferenceId, textColor),
            buildListTile('Nombre', widget.data.name, textColor),
            buildListTile('URL NASA JPL', widget.data.nasaJplUrl, textColor),
            buildListTile('Magnitud absoluta H', widget.data.absoluteMagnitudeH?.toString(), textColor),
            if (widget.data.estimatedDiameter != null)
              buildListTile(
                'Diámetro estimado (km)',
                'Min: ${widget.data.estimatedDiameter!.kilometers?.estimatedDiameterMin?.toString() ?? "No disponible"} - Max: ${widget.data.estimatedDiameter!.kilometers?.estimatedDiameterMax?.toString() ?? "No disponible"}',
                textColor,
              ),
            buildListTile('Es objeto centinela', widget.data.isSentryObject != null ? (widget.data.isSentryObject! ? "Sí" : "No") : "No disponible", textColor),
            buildListTile('Es potencialmente peligroso', widget.data.isPotentiallyHazardousAsteroid != null ? (widget.data.isPotentiallyHazardousAsteroid! ? "Sí" : "No") : "No disponible", textColor),
            buildListTile('Enlace propio', widget.data.links?.self, textColor),
            if (widget.data.closeApproachData != null)
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
                    'Fechas de aproximación cercanas',
                    style: TextStyle(
                      fontFamily: 'Exo',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  initiallyExpanded: isExpanded,
                  onExpansionChanged: (bool expanded) {
                    setState(() {
                      isExpanded = expanded;
                    });
                  },
                  children: widget.data.closeApproachData!.map((approach) {
                    double missDistanceKm = double.tryParse(approach.missDistance?.kilometers.toString() ?? '0') ?? 0;
                    Color approachTextColor = missDistanceKm <= 7479893.5 ? Colors.red : Colors.white;

                    return ListTile(
                      title: Text(
                        'Fecha de aproximación cercana',
                        style: TextStyle(color: approachTextColor, fontFamily: 'Exo', fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        '${approach.closeApproachDate ?? "No disponible"}\nVelocidad relativa (km/h): ${approach.relativeVelocity?.kilometersPerHour?.toString() ?? "No disponible"}\nDistancia de paso (km): ${approach.missDistance?.kilometers?.toString() ?? "No disponible"}',
                        style: TextStyle(color: approachTextColor, fontFamily: 'Exo', fontWeight: FontWeight.bold),
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

  Widget buildListTile(String title, String? value, Color textColor, {bool isSubtitle = false}) {
    return ListTile(
      title: Text(
        '$title: ${value ?? "No disponible"}',
        style: TextStyle(
          fontFamily: 'Exo',
          fontWeight: FontWeight.bold,
          color: textColor,
          fontSize: isSubtitle ? 16.0 : 18.0,
        ),
      ),
      subtitle: isSubtitle
          ? Text(
        value ?? "No disponible",
        style: TextStyle(
          fontFamily: 'Exo',
          fontWeight: FontWeight.bold,
          color: textColor,
        ),
      )
          : null,
    );
  }
}





