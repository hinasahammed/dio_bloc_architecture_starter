abstract class TodoEvent {}

class FetchTodosEvent extends TodoEvent {}

class FetchTodoByIdEvent extends TodoEvent {
  FetchTodoByIdEvent({required this.id});
  final String id;
}
