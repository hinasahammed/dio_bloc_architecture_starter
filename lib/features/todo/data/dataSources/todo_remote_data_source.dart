
import 'package:dio_bloc_architecture_starter/features/todo/data/models/todo_model/todo_model.dart';

abstract class TodoRemoteDataSource {
  Future<List<TodoModel>> getTodos();
  Future<TodoModel> getTodo(String id);
}
