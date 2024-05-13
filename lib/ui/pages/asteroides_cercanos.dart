import 'package:flutter/material.dart';
import 'package:final_boss/ui/pages/terms_and_conditions_screen.dart';

import '../../models/NeoWsData.dart';
import '../../models/NeoWsNeoData.dart';
import '../../repositories/NeoWsNeoRepository.dart';
import '../../repositories/NeoWsRepository.dart';

import 'package:flutter/material.dart';

class InicioWidget extends StatefulWidget {
  @override
  _InicioWidgetState createState() => _InicioWidgetState();
}

class _InicioWidgetState extends State<InicioWidget> {
  TextEditingController _startDateController = TextEditingController();
  TextEditingController _endDateController = TextEditingController();
  TextEditingController _idController = TextEditingController();


  final NeoWsRepository _neoWsRepository = NeoWsRepository();
  final NeoWsNeoRepository _neoWsNeoRepository = NeoWsNeoRepository();

  bool _isPanel1Expanded = false;
  bool _isPanel2Expanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(10),
            child: Theme(
              data: ThemeData(
                dividerColor: Colors.blue[900],
                expansionTileTheme: ExpansionTileThemeData(
                  iconColor: Colors.white,
                  collapsedIconColor: Colors.white,
                  textColor: Colors.white,
                ),
              ),
              child: ExpansionPanelList(
                elevation: 1,
                expandedHeaderPadding: EdgeInsets.all(0),
                expansionCallback: (int index, bool isExpanded) {
                  setState(() {
                    if (index == 0) {
                      _isPanel1Expanded = !_isPanel1Expanded;
                    } else if (index == 1) {
                      _isPanel2Expanded = !_isPanel2Expanded;
                    }
                  });
                },
                children: [
                  ExpansionPanel(
                    canTapOnHeader: true,
                    backgroundColor: Colors.blue[900],
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return ListTile(
                        title: Text(
                          'Buscar Asteroides por rango de fechas',
                          style: TextStyle(
                            fontFamily: 'Exo',
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 24.0,
                          ),
                        ),
                      );
                    },
                    body: Container(
                      color: Colors.lightBlue[100],  // Color claro para el contenido
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            TextField(
                              controller: _startDateController,
                              decoration: InputDecoration(
                                labelText: 'Fecha de inicio',
                                labelStyle: TextStyle(
                                  fontFamily: 'Exo',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20.0,
                                ),
                              ),
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(height: 10),
                            TextField(
                              controller: _endDateController,
                              decoration: InputDecoration(
                                labelText: 'Fecha fin',
                                labelStyle: TextStyle(
                                  fontFamily: 'Exo',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20.0,
                                ),
                              ),
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () async {
                                if (_startDateController.text.isEmpty || _endDateController.text.isEmpty) {
                                  print('Las fechas no pueden estar vacías');
                                  return;
                                }
                                try {
                                  NeoWsData data = await _neoWsRepository.fetchNeoWsData(_startDateController.text, _endDateController.text);
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => NeoWsDataWidget(data),
                                  ));
                                } catch (e) {
                                  print('Error: $e');
                                }
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue[900]!),
                              ),
                              child: Text(
                                'Buscar',
                                style: TextStyle(
                                  fontFamily: 'Exo',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    isExpanded: _isPanel1Expanded,
                  ),
                  ExpansionPanel(
                    canTapOnHeader: true,
                    backgroundColor: Colors.blue[900],
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return ListTile(
                        title: Text(
                          'Buscar asteroides por ID',
                          style: TextStyle(
                            fontFamily: 'Exo',
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 24.0,
                          ),
                        ),
                      );
                    },
                    body: Container(
                      color: Colors.lightBlue[100],  // Color claro para el contenido
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            TextField(
                              controller: _idController,
                              decoration: InputDecoration(
                                labelText: 'ID',
                                labelStyle: TextStyle(
                                  fontFamily: 'Exo',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20.0,
                                ),
                              ),
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () async {
                                if (_idController.text.isEmpty) {
                                  print('El ID no puede estar vacío');
                                  return;
                                }
                                try {
                                  NeoWsNeoData data = await _neoWsNeoRepository.fetchNeoWsNeoData(_idController.text);
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => NeoWsNeoDataWidget(data),
                                  ));
                                } catch (e) {
                                  print('Error: $e');
                                }
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue[900]!),
                              ),
                              child: Text(
                                'Buscar',
                                style: TextStyle(
                                  fontFamily: 'Exo',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    isExpanded: _isPanel2Expanded,
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

class AsteroidesCercanos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white), // Cambia el color del icono a blanco
        title: Padding(
          padding: EdgeInsets.only(left: 0.0), // Añade margen a la izquierda del título
          child: Text(
            'Asteroides Cercanos a la Tierra',
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
      body: InicioWidget(),
    );
  }
}