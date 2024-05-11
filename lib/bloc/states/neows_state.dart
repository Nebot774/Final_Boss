import '../../models/NeoWsData.dart';

abstract class NeoWsState {}

class NeoWsInitial extends NeoWsState {}

class NeoWsLoading extends NeoWsState {}

class NeoWsLoaded extends NeoWsState {
  final NeoWsData neowsData;

  NeoWsLoaded({required this.neowsData});
}

class NeoWsError extends NeoWsState {
  final String message;

  NeoWsError({required this.message});
}