import '../models/mission_model.dart';

abstract class MissionState {}

class MissionInitial extends MissionState {}

class MissionLoading extends MissionState {}

class MissionLoaded extends MissionState {
  final List<Mission> missions;
  MissionLoaded({required this.missions});
}

class MissionError extends MissionState {
  final String error;
  MissionError({required this.error});
}
