import '../../models/MarsRover.dart';
import '../../models/MissionManifest.dart';

abstract class MarsRoverState {}

class MarsRoverInitial extends MarsRoverState {}

class MarsRoverLoading extends MarsRoverState {}

class MarsRoverLoaded extends MarsRoverState {
  final List<MarsRoverPhoto> photos;

  MarsRoverLoaded({required this.photos});
}

class MarsRoverError extends MarsRoverState {
  final String message;

  MarsRoverError({required this.message});
}

class MissionManifestLoading extends MarsRoverState {}

class MissionManifestLoaded extends MarsRoverState {
  final MissionManifest missionManifest;

  MissionManifestLoaded({required this.missionManifest});
}

class MissionManifestError extends MarsRoverState {
  final String message;

  MissionManifestError({required this.message});
}