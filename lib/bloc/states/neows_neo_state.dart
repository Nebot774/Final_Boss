import '../../models/NeoWsNeoData.dart';

abstract class NeoWsNeoState {}

class NeoWsNeoInitial extends NeoWsNeoState {}

class NeoWsNeoLoading extends NeoWsNeoState {}

class NeoWsNeoLoaded extends NeoWsNeoState {
  final NeoWsNeoData neowsNeoData;

  NeoWsNeoLoaded({required this.neowsNeoData});
}

class NeoWsNeoError extends NeoWsNeoState {
  final String message;

  NeoWsNeoError({required this.message});
}