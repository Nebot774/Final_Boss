abstract class MarsRoverEvent {}

class FetchMarsRoverPhotos extends MarsRoverEvent {
  final String rover;
  final String earthDate;
  final String camera;

  FetchMarsRoverPhotos({required this.rover, required this.earthDate, required this.camera});
}

class FetchMissionManifest extends MarsRoverEvent {
  final String roverName;

  FetchMissionManifest({required this.roverName});
}