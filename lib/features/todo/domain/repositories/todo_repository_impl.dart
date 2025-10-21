import 'package:dartz/dartz.dart';
import 'package:dio_bloc_architecture_starter/core/error/exceptions.dart';
import 'package:dio_bloc_architecture_starter/core/error/failures.dart';
import 'package:dio_bloc_architecture_starter/core/network/networkInfo/network_info.dart';
import 'package:dio_bloc_architecture_starter/features/todo/data/dataSources/todo_remote_data_source.dart';
import 'package:dio_bloc_architecture_starter/features/todo/data/models/todo_model/todo_model.dart';
import 'package:dio_bloc_architecture_starter/features/todo/domain/repositories/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  TodoRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  final TodoRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, TodoModel>> getTodo(String id) async {
    if (await networkInfo.isConnected) {
      try {
        final todo = await remoteDataSource.getTodo(id);
        return Right(todo);
      } on ServerException catch (e) {
        return Left(
          ServerFailure(message: e.message, statusCode: e.statusCode),
        );
      } on NetworkException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return Left(NetworkFailure(message: "No Internet Connection!"));
    }
  }

  @override
  Future<Either<Failure, List<TodoModel>>> getTodos() async {
    if (await networkInfo.isConnected) {
      try {
        final todos = await remoteDataSource.getTodos();
        return Right(todos);
      } on ServerException catch (e) {
        return Left(
          ServerFailure(message: e.message, statusCode: e.statusCode),
        );
      } on NetworkException catch (e) {
        return Left(NetworkFailure(message: e.message));
      }
    } else {
      return Left(NetworkFailure(message: "No Internet Connection"));
    }
  }
}
