
// Implementa el BLoC
import '../../models/ApodData.dart';
import '../../repositories/ApodRepository.dart';
import '../events/apod_event.dart';
import '../states/apod_state.dart';
import 'package:bloc/bloc.dart';

class ApodBloc extends Bloc<ApodEvent, ApodState> {
  final ApodRepository apodRepository;

  ApodBloc({required this.apodRepository}) : super(ApodInitial()) {
    on<FetchApodData>((event, emit) async {
      emit(ApodLoading());
      try {
        final ApodData apodData = await apodRepository.fetchApodData();
        emit(ApodLoaded(apodData: apodData));
      } catch (e) {
        emit(ApodError(message: e.toString()));
      }
    });
  }
}