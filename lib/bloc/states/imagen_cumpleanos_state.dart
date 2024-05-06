
// lib/bloc/states/imagen_cumpleanos_state.dart
import '../../models/ApodData.dart';
import 'package:translator/translator.dart';

abstract class ImagenCumpleanosState {
  final translator = GoogleTranslator();
}

class ImagenCumpleanosInitial extends ImagenCumpleanosState {}

class ImagenCumpleanosLoading extends ImagenCumpleanosState {}

class ImagenCumpleanosLoaded extends ImagenCumpleanosState {
  final ApodData apodData;

  ImagenCumpleanosLoaded({required this.apodData});
}

class ImagenCumpleanosError extends ImagenCumpleanosState {
  final String message;

  ImagenCumpleanosError({required this.message});
}