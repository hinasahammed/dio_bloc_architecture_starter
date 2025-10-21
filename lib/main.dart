import 'package:dio_bloc_architecture_starter/core/navigation/app_router.dart';
import 'package:dio_bloc_architecture_starter/di/injection.dart';
import 'package:dio_bloc_architecture_starter/features/todo/presentation/bloc/todo_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TodoBloc>(create: (context) => getIt<TodoBloc>()),
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        routerConfig: AppRouter.routes,
      ),
    );
  }
}
