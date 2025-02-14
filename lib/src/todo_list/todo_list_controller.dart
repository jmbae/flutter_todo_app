import 'package:flutter/material.dart';
import 'package:flutter_todo_app/src/todo_list/todo_list_service.dart';

import '../models/todo.dart';

class TodoListController {
  final TodoListService _todoListService;

  TodoListController(this._todoListService);

  List<Todo> _todos = [];

  List<Todo> get todos => _todos;

  Future<void> loadTodos() async {
    // Load todos from a database or a web service.
    _todos = await _todoListService.loadTodos();
  }

  void add(String todoTitle) {
    _todos.add(Todo(title: todoTitle));
    _todoListService.saveTodos(todos);
  }

  void toggle(Todo todo) {
    todo.completed = !todo.completed;
    debugPrint('Todo ${todo.title} is completed: ${todo.completed}');
    _todoListService.saveTodos(todos);
  }

  void remove(Todo todo) {
    _todos.remove(todo);
    _todoListService.saveTodos(todos);
  }
}
