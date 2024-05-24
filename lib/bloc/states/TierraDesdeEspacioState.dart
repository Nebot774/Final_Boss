import '../../models/TierraDesdeEspacio.dart';

abstract class TierraDesdeEspacioState {}

class TierraDesdeEspacioInitial extends TierraDesdeEspacioState {}

class TierraDesdeEspacioLoading extends TierraDesdeEspacioState {}

class TierraDesdeEspacioLoaded extends TierraDesdeEspacioState {
  final TierraDesdeEspacio tierraDesdeEspacio;

  TierraDesdeEspacioLoaded(this.tierraDesdeEspacio);
}

class TierraDesdeEspacioError extends TierraDesdeEspacioState {
  final String message;

  TierraDesdeEspacioError(this.message);
}