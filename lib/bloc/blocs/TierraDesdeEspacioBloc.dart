import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/TierraDesdeEspacio.dart';
import '../../repositories/TierraDesdeEspacioRepository.dart';
import '../events/TierraDesdeEspacioEvent.dart';
import '../states/TierraDesdeEspacioState.dart';

class TierraDesdeEspacioBloc extends Bloc<TierraDesdeEspacioEvent, TierraDesdeEspacioState> {
  final TierraDesdeEspacioRepository tierraDesdeEspacioRepository;

  TierraDesdeEspacioBloc(this.tierraDesdeEspacioRepository) : super(TierraDesdeEspacioInitial()) {
    on<FetchTierraDesdeEspacio>((event, emit) async {
      emit(TierraDesdeEspacioLoading());
      try {
        final TierraDesdeEspacio tierraDesdeEspacio = await tierraDesdeEspacioRepository.fetchTierraDesdeEspacio(event.lat, event.lon, event.date);
        emit(TierraDesdeEspacioLoaded(tierraDesdeEspacio));
      } catch (e) {
        emit(TierraDesdeEspacioError(e.toString()));
      }
    });
  }
}