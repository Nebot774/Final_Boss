// Define los estados del BLoC
import '../../models/ApodData.dart';

abstract class ApodState {}

class ApodInitial extends ApodState {}

class ApodLoading extends ApodState {}

class ApodLoaded extends ApodState {
  final ApodData apodData;

  ApodLoaded({required this.apodData});
}

class ApodError extends ApodState {
  final String message;

  ApodError({required this.message});
}