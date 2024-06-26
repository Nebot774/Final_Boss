import 'package:flutter/material.dart';

import '../models/MissionManifest.dart';
import '../repositories/MarsRoverRepository.dart';

import 'package:flutter/material.dart';


class MarsRoverMissionManifestWidget extends StatefulWidget {
  final String roverName;

  MarsRoverMissionManifestWidget({required this.roverName});

  @override
  _MarsRoverMissionManifestWidgetState createState() => _MarsRoverMissionManifestWidgetState();
}

class _MarsRoverMissionManifestWidgetState extends State<MarsRoverMissionManifestWidget> {
  final MarsRoverRepository repository = MarsRoverRepository(
    baseUrl: 'https://api.nasa.gov/mars-photos/api/v1',
  );

  bool isLoading = false;
  bool isExpanded = false;  // Mostrar plegado por defecto
  MissionManifest? missionManifest;

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      expandedHeaderPadding: EdgeInsets.all(0),
      expansionCallback: (int index, bool isCurrentlyExpanded) {
        setState(() {
          this.isExpanded = !this.isExpanded;
          if (this.isExpanded) {
            _fetchMissionManifest();
          }
        });
      },
      children: [
        ExpansionPanel(
          backgroundColor: Colors.red,
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: FittedBox(
                child: Text(
                  'Ver Manifiesto de Misión',
                  style: TextStyle(
                    fontFamily: 'Exo',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                  ),
                ),
              ),
            );
          },
          body: isLoading
              ? Padding(
            padding: const EdgeInsets.all(20.0),
            child: CircularProgressIndicator(),
          )
              : missionManifest != null
              ? Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  child: Text('Nombre: ${missionManifest!.photoManifest.name}', style: TextStyle(fontFamily: 'Exo', fontWeight: FontWeight.bold, color: Colors.white, fontSize: MediaQuery.of(context).size.width * 0.05)),
                ),
                FittedBox(
                  child: Text('Fecha de aterrizaje: ${missionManifest!.photoManifest.landingDate}', style: TextStyle(fontFamily: 'Exo', fontWeight: FontWeight.bold, color: Colors.white, fontSize: MediaQuery.of(context).size.width * 0.05)),
                ),
                FittedBox(
                  child: Text('Fecha de lanzamiento: ${missionManifest!.photoManifest.launchDate}', style: TextStyle(fontFamily: 'Exo', fontWeight: FontWeight.bold, color: Colors.white, fontSize: MediaQuery.of(context).size.width * 0.05)),
                ),
                FittedBox(
                  child: Text('Estado: ${missionManifest!.photoManifest.status}', style: TextStyle(fontFamily: 'Exo', fontWeight: FontWeight.bold, color: Colors.white, fontSize: MediaQuery.of(context).size.width * 0.05)),
                ),
                FittedBox(
                  child: Text('Máximo sol: ${missionManifest!.photoManifest.maxSol}', style: TextStyle(fontFamily: 'Exo', fontWeight: FontWeight.bold, color: Colors.white, fontSize: MediaQuery.of(context).size.width * 0.05)),
                ),
                FittedBox(
                  child: Text('Fecha máxima: ${missionManifest!.photoManifest.maxDate}', style: TextStyle(fontFamily: 'Exo', fontWeight: FontWeight.bold, color: Colors.white, fontSize: MediaQuery.of(context).size.width * 0.05)),
                ),
                FittedBox(
                  child: Text('Total de fotos: ${missionManifest!.photoManifest.totalPhotos}', style: TextStyle(fontFamily: 'Exo', fontWeight: FontWeight.bold, color: Colors.white, fontSize: MediaQuery.of(context).size.width * 0.05)),
                ),
              ],
            ),
          )
              : Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'No se pudo cargar el manifiesto de misión.',
              style: TextStyle(color: Colors.white),
            ),
          ),
          isExpanded: isExpanded,
        ),
      ],
    );
  }

  void _fetchMissionManifest() async {
    print('Fetching mission manifest...');

    setState(() {
      isLoading = true;
    });

    try {
      final manifest = await repository.getMissionManifest(widget.roverName);
      print('Mission manifest fetched: $manifest');
      setState(() {
        missionManifest = manifest;
      });
    } catch (e) {
      print('Error al obtener el manifiesto de la misión: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }
}