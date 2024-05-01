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

  ImagenCumpleanosBloc({required this.imagenCumpleanosRepository}) : super(ImagenCumpleanosInitial());

  @override
  Stream<ImagenCumpleanosState> mapEventToState(ImagenCumpleanosEvent event) async* {
    if (event is FetchImagenCumpleanos) {
      yield ImagenCumpleanosLoading();
      try {
        final ApodData apodData = await imagenCumpleanosRepository.fetchImagenCumpleanosData(event.fecha);
        yield ImagenCumpleanosLoaded(apodData: apodData);
      } catch (_) {
        yield ImagenCumpleanosError(message: 'Something went wrong');
      }
    }
    // Asegúrate de que estás devolviendo un Stream<ApodState> en este método
    else {
      yield ImagenCumpleanosInitial();
    }
  }
}