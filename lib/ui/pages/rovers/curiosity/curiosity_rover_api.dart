import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../models/MarsRover.dart';
import '../../../../repositories/MarsRoverRepository.dart';
import '../../../../widgets/MarsRoverLoadWidget.dart';
import '../../../../widgets/MarsRoverMissionManifestWidget.dart';
import '../../../../widgets/MarsRoverSearchWidget.dart';
import 'package:flutter/material.dart';

import '../../terms_and_conditions_screen.dart';

class CuriosityRover extends StatefulWidget {
  @override
  _CuriosityRoverState createState() => _CuriosityRoverState();
}

class _CuriosityRoverState extends State<CuriosityRover> {
  final MarsRoverRepository repository = MarsRoverRepository(
    baseUrl: 'https://api.nasa.gov/mars-photos/api/v1',
  );

  List<MarsRoverPhoto> photos = [];
  bool isLoading = false;
  bool hasSearched = false;

  void _searchPhotos(String roverName, DateTime date, String camera) async {
    setState(() {
      isLoading = true;
      hasSearched = true;
    });

    try {
      final dateString = DateFormat('yyyy-MM-dd').format(date);
      final results = await repository.fetchMarsRoverPhotos(roverName, dateString, camera);
      setState(() {
        photos = results;
      });
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            if (!hasSearched) ...[
              MarsRoverSearchWidget(onSearch: _searchPhotos, roverName: 'Curiosity'),
              MarsRoverMissionManifestWidget(roverName: 'Curiosity'),
            ],
            if (isLoading)
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: CircularProgressIndicator(),
              ),
            if (hasSearched && !isLoading)
              MarsRoverLoadWidget(photos: photos),
          ],
        ),
      ),
    );
  }
}