abstract class NeoWsNeoEvent {}

class FetchNeoWsNeoData extends NeoWsNeoEvent {
  final String startDate;
  final String endDate;

  FetchNeoWsNeoData({required this.startDate, required this.endDate});
}