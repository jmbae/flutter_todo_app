import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_todo_app/src/todo_list/todo_list_controller.dart';

import '../settings/settings_view.dart';

class TodoListView extends StatefulWidget {
  const TodoListView({super.key, required this.controller});
  final TodoListController controller;

  static const routeName = '/';

  @override
  State<TodoListView> createState() => _TodoListViewState();
}

class _TodoListViewState extends State<TodoListView> {
  final _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadTodos();
  }

  Future<void> _loadTodos() async {
    await widget.controller.loadTodos();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text(AppLocalizations.of(context)!.appTitle), actions: [
        IconButton(
            onPressed: () {
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
            icon: const Icon(Icons.settings)),
      ]),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: InputDecoration(
                      labelText: 'add todo',
                    ),
                    onSubmitted: (value) {
                      setState(() {
                        widget.controller.add(value);
                        _textController.clear();
                      });
                    },
                  ),
                ),
                IconButton(
                    onPressed: () {
                      setState(() {
                        widget.controller.add(_textController.text);
                        _textController.clear();
                      });
                    },
                    icon: const Icon(Icons.add))
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.controller.todos.length,
              itemBuilder: (context, index) {
                final todo = widget.controller.todos[index];
                return ListTile(
                  title: Text(todo.title,
                      style: todo.completed
                          ? const TextStyle(
                              decoration: TextDecoration.lineThrough)
                          : null),
                  leading: Checkbox(
                    value: todo.completed,
                    onChanged: (value) {
                      setState(() {
                        widget.controller.toggle(todo);
                      });
                    },
                  ),
                  trailing: IconButton(
                      onPressed: () {
                        setState(() {
                          widget.controller.remove(todo);
                        });
                      },
                      icon: const Icon(Icons.delete)),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
