part of 'crud_bloc.dart';


abstract class CrudState extends Equatable {
  final List<Task> pendingTasks;
  
  const CrudState({this.pendingTasks = const <Task>[]});
}

class CrudInitial extends CrudState {
  @override
  List<Object> get props => [pendingTasks];
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