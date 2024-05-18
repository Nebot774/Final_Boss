import 'package:flutter/material.dart';

import '../models/MarsRover.dart';



class MarsRoverLoadWidget extends StatelessWidget {
  final List<MarsRoverPhoto> photos;

  MarsRoverLoadWidget({required this.photos});

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
        : GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.8,
      ),
      itemCount: photos.length,
      itemBuilder: (context, index) {
        final photo = photos[index];
        return Card(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
        );
      },
    );
  }
}

