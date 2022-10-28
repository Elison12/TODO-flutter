part of 'crud_bloc.dart';


abstract class CrudState extends Equatable {
  const CrudState();
}

class CrudInitial extends CrudState {
  @override
  List<Object> get props => [];
}

class DisplayTodos extends CrudState {
  final List<Task> task;

  const DisplayTodos({required this.task});

  @override
  List<Object> get props => [task];
}

class DisplaySpecificTodo extends CrudState {
  final Task task;

  const DisplaySpecificTodo({required this.task});

  @override
  List<Object> get props => [task];
}