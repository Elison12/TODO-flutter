part of 'circularProgress_bloc.dart';

abstract class CircularProgressEvent{}

class ProgressIncrementEvent extends CircularProgressEvent {}

class ProgressDecrementEvent extends CircularProgressEvent {}