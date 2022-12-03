import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'circularProgress_event.dart';
part 'circularProgress_state.dart';

class CircularProgressBloc extends Bloc<CircularProgressEvent, CircularProgressState> {
  CircularProgressBloc() : super(ProgressInitial()) {
    
    on<ProgressIncrementEvent>((event, emit) {
      emit(IncrementState(state.progress + 0.1));
    });

    on<ProgressDecrementEvent>((event, emit) {
      emit(DecrementState(state.progress - 0.1));
    });
  }

  @override
  CircularProgressState? fromJson(Map<String, dynamic> json) {
    return CircularProgressState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(CircularProgressState state) {
    return state.toMap();
  }
}