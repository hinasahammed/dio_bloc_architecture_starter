import 'package:dio_bloc_architecture_starter/features/todo/data/models/todo_model/todo_model.dart';

abstract class TodoState {}

class TodoInitial extends TodoState {}

class TodoLoading extends TodoState {}

class TodoLoaded extends TodoState {
  TodoLoaded({required this.todos});
  final List<TodoModel> todos;
}

class SingleTodoLoaded extends TodoState {
  SingleTodoLoaded({required this.todo});
  final TodoModel todo;
}

class TodoError extends TodoState {
  TodoError({required this.message});
  final String message;
}
