import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../models/todo.dart';
import '../settings/settings_view.dart';

class TodoListView extends StatefulWidget {
  const TodoListView({super.key});
  static const routeName = '/';

  @override
  State<TodoListView> createState() => _TodoListViewState();
}

class _TodoListViewState extends State<TodoListView> {
  final List<Todo> _todoList = [
    Todo(title: 'Buy milk'),
    Todo(title: 'Buy eggs'),
    Todo(title: 'Buy bread'),
  ];
  final _textController = TextEditingController();

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
                    onSubmitted: (value) {},
                  ),
                ),
                IconButton(onPressed: () {}, icon: const Icon(Icons.add))
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _todoList.length,
              itemBuilder: (context, index) {
                final todo = _todoList[index];
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
                        todo.completed = value!;
                      });
                    },
                  ),
                  trailing: IconButton(
                      onPressed: () {
                        // TODO: 삭제 구현
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
