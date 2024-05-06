// En lib/bloc/states/galeria_state.dart
import '../../models/GaleriaData.dart';

abstract class GaleriaState {}

class GaleriaInitial extends GaleriaState {}

class GaleriaLoading extends GaleriaState {}

class GaleriaLoaded extends GaleriaState {
  final GaleriaData galeriaData;

  GaleriaLoaded({required this.galeriaData});
}

class GaleriaError extends GaleriaState {
  final String message;

  GaleriaError({required this.message});
}