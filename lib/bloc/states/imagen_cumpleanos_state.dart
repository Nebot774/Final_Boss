
// lib/bloc/states/imagen_cumpleanos_state.dart
import '../../models/ApodData.dart';

abstract class ImagenCumpleanosState {}

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