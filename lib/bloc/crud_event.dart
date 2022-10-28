part of 'crud_bloc.dart';

abstract class CrudEvent extends Equatable {
  const CrudEvent();
}

class AddTodo extends CrudEvent {
  final int id;
  final String title;
  final String description;
  final DateTime createdTime;

  const AddTodo(
      {required this.id,
      required this.title,
      required this.description,
      required this.createdTime});

  @override
  List<Object?> get props => [title, id, description, createdTime];
}

class UpdateTodo extends CrudEvent {
  final Task task;
  const UpdateTodo({required this.task});
  @override
  List<Object?> get props => [task];
}

class FetchTodos extends CrudEvent {
  const FetchTodos();

  @override
  List<Object?> get props => [];
}

class FetchSpecificTodo extends CrudEvent {
  final int id;
  const FetchSpecificTodo({required this.id});

  @override
  List<Object?> get props => [id];
}

class DeleteTodo extends CrudEvent {
  final int id;
  const DeleteTodo({required this.id});
  @override
  List<Object?> get props => [id];
}
