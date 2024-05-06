// En lib/bloc/events/galeria_event.dart
// En lib/bloc/events/galeria_event.dart
abstract class GaleriaEvent {}

class FetchGaleriaData extends GaleriaEvent {
  final String query;
  final String startDate;
  final String endDate;
  final String mediaType;

  FetchGaleriaData({required this.query, required this.startDate, required this.endDate, required this.mediaType});
}

class FetchGaleriaDefectoData extends GaleriaEvent {}