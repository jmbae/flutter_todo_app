import '../models/todo.dart';

class TodoListController {
  final List<Todo> _todos = [
    Todo(title: 'Buy milk'),
    Todo(title: 'Buy eggs'),
    Todo(title: 'Buy bread'),
  ];

  List<Todo> get todos => _todos;

  Future<void> loadTodos() async {
    // Load todos from a database or a web service.
  }

  void add(String todoTitle) {
    _todos.add(Todo(title: todoTitle));
  }

  void toggle(Todo todo) {
    todo.completed = !todo.completed;
  }

  void remove(Todo todo) {
    _todos.remove(todo);
  }
}
