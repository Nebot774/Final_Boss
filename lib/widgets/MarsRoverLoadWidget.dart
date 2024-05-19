import 'package:flutter/material.dart';

import '../models/MarsRover.dart';
import 'package:flutter/material.dart';


class MarsRoverLoadWidget extends StatelessWidget {
  final List<MarsRoverPhoto> photos;

  MarsRoverLoadWidget({required this.photos});

  void _showDetails(BuildContext context, MarsRoverPhoto photo) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Image.network(
                  photo.imgSrc,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('ID: ${photo.id}', style: TextStyle(color: Colors.black)),
                      Text('Sol: ${photo.sol}', style: TextStyle(color: Colors.black)),
                      Text('Earth Date: ${photo.earthDate}', style: TextStyle(color: Colors.black)),
                      Text('Landing Date: ${photo.rover.landingDate}', style: TextStyle(color: Colors.black)),
                      Text('Launch Date: ${photo.rover.launchDate}', style: TextStyle(color: Colors.black)),
                      Text('Status: ${photo.rover.status}', style: TextStyle(color: Colors.black)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return photos.isEmpty
        ? Center(
      child: Text(
        'No se encontraron fotos para la fecha y cámara seleccionadas.',
        style: TextStyle(
          fontFamily: 'Exo',
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    )
        : ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: photos.length,
      itemBuilder: (context, index) {
        final photo = photos[index];
        return GestureDetector(
          onTap: () => _showDetails(context, photo),
          child: Column(
            children: <Widget>[
              Image.network(
                photo.imgSrc,
                fit: BoxFit.cover,
              ),

            ],
          ),
        );
      },
    );
  }
}

