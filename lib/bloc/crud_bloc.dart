import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todov2/models/task.dart';
import 'package:equatable/equatable.dart';

import '../db/tasks_database.dart';

part 'crud_event.dart';
part 'crud_state.dart';

class CrudBloc extends Bloc<CrudEvent, CrudState> {
  CrudBloc() : super(CrudInitial()) {
    List<Task> tasks = [];
    
    on<AddTodo>((event, emit) async {
      await TaskDataBase.instance.create(Task(
        // id: event.id,
        title: event.title,
        description: event.description,
        createdTime: event.createdTime,
        // isDone: event.isDone
      ));
    });

    on<UpdateTodo>((event, emit) async {
      await TaskDataBase.instance.update(event.task);
    });

    on<FetchTodos>((event, emit) async {
      tasks = await TaskDataBase.instance.readAllTasks();
      emit(DisplayTodos(task: tasks));
    });

    on<FetchSpecificTodo>((event, emit) async {
      Task task = await TaskDataBase.instance.readTask(id: event.id);
      emit(DisplaySpecificTodo(task: task));
    });

    on<DeleteTodo>((event, emit) async {
      await TaskDataBase.instance.delete(event.id);
      add(const FetchTodos());
    });
  }
}
