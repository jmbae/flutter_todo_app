import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import '../models/todo.dart';

class TodoListService {
  static const String _todosKey = 'todos';

  Future<List<Todo>> loadTodos() async {
    final prefs = await SharedPreferences.getInstance();
    final todoString = prefs.getString(_todosKey);
    if (todoString == null) {
      return [];
    }
    final List<dynamic> todoJson = jsonDecode(todoString);
    return todoJson.map((json) => Todo.fromJson(json)).toList();
  }

  Future<void> saveTodos(List<Todo> todos) async {
    final prefs = await SharedPreferences.getInstance();
    final todoString = jsonEncode(todos.map((todo) => todo.toJson()).toList());
    await prefs.setString(_todosKey, todoString);
  }
}
