import 'package:flutter_bloc/flutter_bloc.dart';

abstract class ExpansionEvent {}

class ToggleExpansion extends ExpansionEvent {}

abstract class ExpansionState {}

class ExpansionCollapsed extends ExpansionState {}

class ExpansionExpanded extends ExpansionState {}

class ExpansionBloc extends Bloc<ExpansionEvent, ExpansionState> {
  ExpansionBloc() : super(ExpansionCollapsed()) {
    on<ToggleExpansion>((event, emit) {
      if (state is ExpansionCollapsed) {
        emit(ExpansionExpanded());
      } else {
        emit(ExpansionCollapsed());
      }
    });
  }
}
