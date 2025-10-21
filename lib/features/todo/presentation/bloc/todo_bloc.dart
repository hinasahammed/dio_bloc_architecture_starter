import 'package:dio_bloc_architecture_starter/features/todo/domain/usecases/todo_use_cases.dart';
import 'package:dio_bloc_architecture_starter/features/todo/presentation/bloc/todo_event.dart';
import 'package:dio_bloc_architecture_starter/features/todo/presentation/bloc/todo_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoUseCases todoUseCases;

  TodoBloc({required this.todoUseCases}) : super(TodoInitial()) {
    on<FetchTodosEvent>((event, emit) async {
      emit(TodoLoading());
      final result = await todoUseCases.getTodos();
      result.fold(
        (failure) => emit(TodoError(message: failure.message)),
        (todos) => emit(TodoLoaded(todos: todos)),
      );
    });

    on<FetchTodoByIdEvent>((event, emit) async {
      emit(TodoLoading());
      final result = await todoUseCases.getTodo(event.id);
      result.fold(
        (failure) => emit(TodoError(message: failure.message)),
        (todo) => emit(SingleTodoLoaded(todo: todo)),
      );
    });
  }
}
