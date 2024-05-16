import 'package:bloc/bloc.dart';

import '../../repositories/MarsRoverRepository.dart';
import '../events/mars_rover_event.dart';
import '../states/mars_rover_state.dart';

class MarsRoverBloc extends Bloc<MarsRoverEvent, MarsRoverState> {
  final MarsRoverRepository marsRoverRepository;

  MarsRoverBloc({required this.marsRoverRepository}) : super(MarsRoverInitial());

  @override
  Stream<MarsRoverState> mapEventToState(MarsRoverEvent event) async* {
    if (event is FetchMarsRoverPhotos) {
      yield MarsRoverLoading();
      try {
        final photos = await marsRoverRepository.fetchMarsRoverPhotos(event.rover, event.earthDate, event.camera);
        yield MarsRoverLoaded(photos: photos);
      } catch (e) {
        yield MarsRoverError(message: e.toString());
      }
    } else if (event is FetchMissionManifest) {
      yield MissionManifestLoading();
      try {
        final missionManifest = await marsRoverRepository.getMissionManifest(event.roverName);
        yield MissionManifestLoaded(missionManifest: missionManifest);
      } catch (e) {
        yield MissionManifestError(message: e.toString());
      }
    }
  }
}