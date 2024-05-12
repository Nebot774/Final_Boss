abstract class NeoWsNeoEvent {}

class FetchNeoWsNeoData extends NeoWsNeoEvent {
  final String id;

  FetchNeoWsNeoData({required this.id});
}