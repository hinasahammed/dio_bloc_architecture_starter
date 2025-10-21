import 'package:dartz/dartz.dart';
import 'package:dio_bloc_architecture_starter/core/error/failures.dart';
import 'package:dio_bloc_architecture_starter/features/todo/data/models/todo_model/todo_model.dart';

abstract class TodoRepository {
  Future<Either<Failure, List<TodoModel>>> getTodos();
  Future<Either<Failure, TodoModel>> getTodo(String id);
}
