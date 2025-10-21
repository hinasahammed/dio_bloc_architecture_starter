
import 'package:dio_bloc_architecture_starter/core/constants/api_constants.dart';
import 'package:dio_bloc_architecture_starter/core/error/exceptions.dart';
import 'package:dio_bloc_architecture_starter/core/network/apiService/api_service.dart';
import 'package:dio_bloc_architecture_starter/features/todo/data/dataSources/todo_remote_data_source.dart';
import 'package:dio_bloc_architecture_starter/features/todo/data/models/todo_model/todo_model.dart';

class TodoRemoteDataSourceImpl implements TodoRemoteDataSource {
  TodoRemoteDataSourceImpl({required this.apiService});

  final ApiService apiService;

  @override
  Future<TodoModel> getTodo(String id) async {
    try {
      final response = await apiService.get("${ApiConstants.todo}/$id");
      if (response.statusCode == 200) {
        return TodoModel.fromJson(response.data);
      } else {
        throw ServerException(
          message: "Failed to load todo",
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      if (e is ServerException || e is NetworkException) {
        rethrow;
      }
      throw ServerException(message: "Unexpected error $e");
    }
  }

  @override
  Future<List<TodoModel>> getTodos() async {
    try {
      final response = await apiService.get(ApiConstants.todo);
      if (response.statusCode == 200) {
        final List<dynamic> jsonList = response.data;
        return jsonList.map((e) => TodoModel.fromJson(e)).toList();
      } else {
        throw ServerException(
          message: 'Failed to load Todos',
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      if (e is ServerException || e is NetworkException) {
        rethrow;
      }
      throw ServerException(message: 'Unexpected error: $e');
    }
  }
}
