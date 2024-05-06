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
        print('GaleriaData: ${galeriaData.items}'); // Imprime los datos de la galería
        emit(GaleriaLoaded(galeriaData: galeriaData));
      } catch (e) {
        print(e); // Imprime el error en la consola
        emit(GaleriaError(message: e.toString()));
      }
    });

    on<FetchGaleriaDefectoData>((event, emit) async {
      emit(GaleriaLoading());
      print('Loading gallery...'); // Agrega esta línea
      try {
        final GaleriaData galeriaData = await galeriaRepository.fetchGaleriaDefectoData();
        print('GaleriaData: ${galeriaData.items}'); // Imprime los datos de la galería
        emit(GaleriaLoaded(galeriaData: galeriaData));
      } catch (e) {
        print(e); // Imprime el error en la consola
        emit(GaleriaError(message: e.toString()));
      }
    });


  }
}