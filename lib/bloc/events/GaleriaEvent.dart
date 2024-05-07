// En lib/bloc/events/galeria_event.dart
// En lib/bloc/events/galeria_event.dart
abstract class GaleriaEvent {}

class FetchGaleriaData extends GaleriaEvent {
  final String query;
  final String startDate;
  final String endDate;
  final String mediaType;
  final int numResults; // Nuevo parámetro

  FetchGaleriaData({required this.query, required this.startDate, required this.endDate, required this.mediaType, required this.numResults});
}

class FetchGaleriaDefectoData extends GaleriaEvent {}

class ResetGaleria extends GaleriaEvent {}