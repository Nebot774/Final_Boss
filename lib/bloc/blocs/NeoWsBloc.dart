import 'package:bloc/bloc.dart';

import '../../models/NeoWsData.dart';
import '../../repositories/NeoWsRepository.dart';
import '../events/neows_event.dart';
import '../states/neows_state.dart';

class NeoWsBloc extends Bloc<NeoWsEvent, NeoWsState> {
  final NeoWsRepository repository;

  NeoWsBloc({required this.repository}) : super(NeoWsInitial());

  @override
  Stream<NeoWsState> mapEventToState(NeoWsEvent event) async* {
    if (event is FetchNeoWsData) {
      yield NeoWsLoading();
      try {
        final NeoWsData neowsData = await repository.fetchNeoWsData(event.startDate, event.endDate);
        yield NeoWsLoaded(neowsData: neowsData);
      } catch (e) {
        yield NeoWsError(message: e.toString());
      }
    }
  }
}