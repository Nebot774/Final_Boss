
// lib/bloc/events/imagen_cumpleanos_event.dart
// lib/bloc/events/imagen_cumpleanos_event.dart
abstract class ImagenCumpleanosEvent {}

class FetchImagenCumpleanos extends ImagenCumpleanosEvent {
  final String fecha;

  FetchImagenCumpleanos({required this.fecha});
}

class ResetImagenCumpleanos extends ImagenCumpleanosEvent {}