// En lib/bloc/blocs/imagen_cumpleanos_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:translator/translator.dart';
import '../../models/ApodData.dart';
import '../../repositories/ImagenCumpleanosRepository.dart';
import '../../bloc/events/apod_event.dart';
import '../../bloc/states/apod_state.dart';
import '../events/imagen_cumpleanos_event.dart';
import '../states/imagen_cumpleanos_state.dart';

class ImagenCumpleanosBloc extends Bloc<ImagenCumpleanosEvent, ImagenCumpleanosState> {
  final ImagenCumpleanosRepository imagenCumpleanosRepository;
  final GoogleTranslator translator = GoogleTranslator();

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

    on<ResetImagenCumpleanos>((event, emit) async {
      emit(ImagenCumpleanosInitial());
    });
  }

  Stream<ImagenCumpleanosState> mapEventToState(ImagenCumpleanosEvent event) async* {
    if (event is FetchImagenCumpleanos) {
      yield ImagenCumpleanosLoading();
      try {
        ApodData data = await imagenCumpleanosRepository.fetchImagenCumpleanosData(event.fecha);
        Translation translation = await translator.translate(data.explanation ?? '', to: 'es');
        String translatedExplanation = translation.text;
        ApodData newData = ApodData(
            title: data.title,
            url: data.url,
            explanation: translatedExplanation, // Reemplaza 'explanation' con 'translatedExplanation'
            copyright: data.copyright,
            date: data.date
        );
        yield ImagenCumpleanosLoaded(apodData: newData);
      } catch (e) {
        yield ImagenCumpleanosError(message: e.toString());
      }
    }
  }
}