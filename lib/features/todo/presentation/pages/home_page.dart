import 'package:dio_bloc_architecture_starter/features/todo/presentation/bloc/todo_bloc.dart';
import 'package:dio_bloc_architecture_starter/features/todo/presentation/bloc/todo_event.dart';
import 'package:dio_bloc_architecture_starter/features/todo/presentation/bloc/todo_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<TodoBloc>().add(FetchTodosEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocBuilder<TodoBloc, TodoState>(
          builder: (context, state) {
            if (state is TodoLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is TodoLoaded) {
              final todos = state.todos;
              if (todos.isEmpty) {
                return const Center(child: Text("No Todos Found"));
              }
              return SingleChildScrollView(
                child: Column(
                  children: todos
                      .map(
                        (todo) => Card(
                          child: ListTile(title: Text(todo.title ?? "")),
                        ),
                      )
                      .toList(),
                ),
              );
            } else if (state is TodoError) {
              return Center(child: Text("Error: ${state.message}"));
            } else {
              return const Center(child: Text("Fetching todos..."));
            }
          },
        ),
      ),
    );
  }
}
