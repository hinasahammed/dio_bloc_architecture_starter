import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio_bloc_architecture_starter/core/network/apiService/api_service.dart';
import 'package:dio_bloc_architecture_starter/core/network/apiService/api_service_impl.dart';
import 'package:dio_bloc_architecture_starter/core/network/dio_client.dart';
import 'package:dio_bloc_architecture_starter/core/network/networkInfo/network_info.dart';
import 'package:dio_bloc_architecture_starter/core/network/networkInfo/network_info_impl.dart';
import 'package:dio_bloc_architecture_starter/features/todo/data/dataSources/todo_remote_data_source.dart';
import 'package:dio_bloc_architecture_starter/features/todo/data/dataSources/todo_remote_data_source_impl.dart';
import 'package:dio_bloc_architecture_starter/features/todo/domain/repositories/todo_repository_impl.dart';
import 'package:dio_bloc_architecture_starter/features/todo/domain/usecases/todo_use_cases.dart';
import 'package:dio_bloc_architecture_starter/features/todo/presentation/bloc/todo_bloc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void initDependencies() {
  //Connectivity
  getIt.registerLazySingleton<Connectivity>(() => Connectivity());

  //Networkinfo
  getIt.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(connectivity: getIt<Connectivity>()),
  );

  //API Service
  getIt.registerLazySingleton<ApiService>(
    () => ApiServiceImpl(dio: DioClient.instance),
  );

  //DataSource
  getIt.registerLazySingleton<TodoRemoteDataSource>(
    () => TodoRemoteDataSourceImpl(apiService: getIt<ApiService>()),
  );

  //Repository
  getIt.registerLazySingleton<TodoRepositoryImpl>(
    () => TodoRepositoryImpl(
      remoteDataSource: getIt<TodoRemoteDataSource>(),
      networkInfo: getIt<NetworkInfo>(),
    ),
  );

  //UseCases
  getIt.registerLazySingleton<TodoUseCases>(
    () => TodoUseCases(repository: getIt<TodoRepositoryImpl>()),
  );

  //Bloc
  getIt.registerFactory<TodoBloc>(
    () => TodoBloc(todoUseCases: getIt<TodoUseCases>()),
  );
}
