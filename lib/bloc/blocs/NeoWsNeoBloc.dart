import 'package:bloc/bloc.dart';

import '../../models/NeoWsNeoData.dart';
import '../../repositories/NeoWsNeoRepository.dart';
import '../events/neows_neo_event.dart';

import '../states/neows_neo_state.dart';


class NeoWsNeoBloc extends Bloc<NeoWsNeoEvent, NeoWsNeoState> {
  final NeoWsNeoRepository repository;

  NeoWsNeoBloc({required this.repository}) : super(NeoWsNeoInitial());

  @override
  Stream<NeoWsNeoState> mapEventToState(NeoWsNeoEvent event) async* {
    if (event is FetchNeoWsNeoData) {
      yield NeoWsNeoLoading();
      try {
        final NeoWsNeoData neowsNeoData = await repository.fetchNeoWsNeoData(event.id);
        yield NeoWsNeoLoaded(neowsNeoData: neowsNeoData);
      } catch (e) {
        yield NeoWsNeoError(message: e.toString());
      }
    }
  }
}