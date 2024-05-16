import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import '../../../../models/MarsRover.dart';
import '../../../../repositories/MarsRoverRepository.dart';
import '../../../../widgets/MarsRoverSearchWidget.dart';
import 'package:flutter/material.dart';


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

  void _searchPhotos(String roverName, DateTime date, String camera) async {
    setState(() {
      isLoading = true;
    });

    try {
      final dateString = "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
      final results = await repository.fetchMarsRoverPhotos(roverName, dateString, camera);
      setState(() {
        photos = results;
      });
    } catch (e) {
      // Maneja el error adecuadamente
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
            MarsRoverSearchWidget(onSearch: _searchPhotos, roverName: 'Curiosity'),
            if (isLoading)
              CircularProgressIndicator()
            else
              ...photos.map((photo) => Image.network(photo.imgSrc)).toList(),
          ],
        ),
      ),
    );
  }
}
