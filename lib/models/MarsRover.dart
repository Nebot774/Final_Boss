// models/mars_rover.dart
class MarsRover {
  final List<MarsRoverPhoto> photos;

  MarsRover({required this.photos});

  factory MarsRover.fromJson(Map<String, dynamic> json) {
    var photosList = json['photos'] as List;
    List<MarsRoverPhoto> photos = photosList.map((i) => MarsRoverPhoto.fromJson(i)).toList();
    return MarsRover(photos: photos);
  }
}

class MarsRoverPhoto {
  final int id;
  final int sol;
  final Camera camera;
  final String imgSrc;
  final String earthDate;
  final Rover rover;

  MarsRoverPhoto({
    required this.id,
    required this.sol,
    required this.camera,
    required this.imgSrc,
    required this.earthDate,
    required this.rover,
  });

  factory MarsRoverPhoto.fromJson(Map<String, dynamic> json) {
    return MarsRoverPhoto(
      id: json['id'],
      sol: json['sol'],
      camera: Camera.fromJson(json['camera']),
      imgSrc: json['img_src'],
      earthDate: json['earth_date'],
      rover: Rover.fromJson(json['rover']),
    );
  }
}

class Camera {
  final int id;
  final String name;
  final int roverId;
  final String fullName;

  Camera({
    required this.id,
    required this.name,
    required this.roverId,
    required this.fullName,
  });

  factory Camera.fromJson(Map<String, dynamic> json) {
    return Camera(
      id: json['id'],
      name: json['name'],
      roverId: json['rover_id'],
      fullName: json['full_name'],
    );
  }
}

class Rover {
  final int id;
  final String name;
  final String landingDate;
  final String launchDate;
  final String status;

  Rover({
    required this.id,
    required this.name,
    required this.landingDate,
    required this.launchDate,
    required this.status,
  });

  factory Rover.fromJson(Map<String, dynamic> json) {
    return Rover(
      id: json['id'],
      name: json['name'],
      landingDate: json['landing_date'],
      launchDate: json['launch_date'],
      status: json['status'],
    );
  }
}
