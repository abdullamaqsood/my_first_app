import 'package:flutter_bloc/flutter_bloc.dart';
import '../services/api_service.dart';
import 'mission_event.dart';
import 'mission_state.dart';

class MissionBloc extends Bloc<MissionEvent, MissionState> {
  final ApiService apiService;

  MissionBloc({required this.apiService}) : super(MissionInitial()) {
    on<FetchMissions>((event, emit) async {
      emit(MissionLoading());
      try {
        final missions = await apiService.fetchMissions();
        emit(MissionLoaded(missions: missions));
      } catch (e) {
        emit(MissionError(error: e.toString()));
      }
    });
  }
}
