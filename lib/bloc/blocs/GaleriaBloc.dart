import 'dart:async';
import 'package:bloc/bloc.dart';

import '../../models/GaleriaData.dart';
import '../../repositories/GaleriaRepository.dart';
import '../events/GaleriaEvent.dart';
import '../states/GaleriaState.dart';

class GaleriaBloc extends Bloc<GaleriaEvent, GaleriaState> {
  final GaleriaRepository galeriaRepository;

  GaleriaBloc({required this.galeriaRepository}) : super(GaleriaInitial()) {

    on<FetchGaleriaData>((event, emit) async {
      emit(GaleriaLoading());
      try {
        final GaleriaData galeriaData = await galeriaRepository.fetchGaleriaData(event.query, event.startDate, event.endDate, event.mediaType);
        emit(GaleriaLoaded(galeriaData: galeriaData));
      } catch (e) {
        emit(GaleriaError(message: e.toString()));
      }
    });

    on<FetchGaleriaDefectoData>((event, emit) async {
      emit(GaleriaLoading());
      try {
        final GaleriaData galeriaData = await galeriaRepository.fetchGaleriaDefectoData();
        emit(GaleriaDefectoLoaded(galeriaData: galeriaData)); // Emite el nuevo estado
      } catch (e) {
        emit(GaleriaError(message: e.toString()));
      }
    });
  }
}