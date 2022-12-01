part of 'circularProgress_bloc.dart';

class CircularProgressState extends Equatable {
  final double progress;

  const CircularProgressState({required this.progress});

  @override
  List<Object> get props => [progress];

  Map<String, dynamic> toMap() {
    return {
      "progress": progress,
    };
  }

  factory CircularProgressState.fromMap(Map<String, dynamic> map) {
    return CircularProgressState(
      progress: map["progress"].toInt() ?? 0,
    );
  }

// String toJson() => json.encode(toMap());
//
// factory progressState.fromJson(String source) => progressState.fromMap(
//       json.decode(
//         source,
//       ),
//     );
}

class ProgressInitial extends CircularProgressState {
  const ProgressInitial() : super(progress: 0);
}

class IncrementState extends CircularProgressState {
  const IncrementState(double increasedValue) : super(progress: increasedValue);
}

class DecrementState extends CircularProgressState {
  const DecrementState(double decreasedValue) : super(progress: decreasedValue);
}