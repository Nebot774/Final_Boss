// En lib/bloc/blocs/imagen_cumpleanos_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/ApodData.dart';
import '../../repositories/ImagenCumpleanosRepository.dart';
import '../../bloc/events/apod_event.dart';
import '../../bloc/states/apod_state.dart';
import '../events/imagen_cumpleanos_event.dart';
import '../states/imagen_cumpleanos_state.dart';

class ImagenCumpleanosBloc extends Bloc<ImagenCumpleanosEvent, ImagenCumpleanosState> {
  final ImagenCumpleanosRepository imagenCumpleanosRepository;

  ImagenCumpleanosBloc({required this.imagenCumpleanosRepository}) : super(ImagenCumpleanosInitial()) {
    on<FetchImagenCumpleanos>((event, emit) async {
      emit(ImagenCumpleanosLoading());
      try {
        final apodData = await imagenCumpleanosRepository.fetchImagenCumpleanosData(event.fecha);
        emit(ImagenCumpleanosLoaded(apodData: apodData));
      } catch (e) {
        emit(ImagenCumpleanosError(message: e.toString()));
      }
    });
  }
}