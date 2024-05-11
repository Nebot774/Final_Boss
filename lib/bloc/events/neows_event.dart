
abstract class NeoWsEvent {}

class FetchNeoWsData extends NeoWsEvent {
  final String startDate;
  final String endDate;

  FetchNeoWsData({required this.startDate, required this.endDate});
}