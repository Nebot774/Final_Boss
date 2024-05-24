abstract class TierraDesdeEspacioEvent {}

class FetchTierraDesdeEspacio extends TierraDesdeEspacioEvent {
  final double lat;
  final double lon;
  final String date;

  FetchTierraDesdeEspacio(this.lat, this.lon, this.date);
}

