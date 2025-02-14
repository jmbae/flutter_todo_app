import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'settings/settings_view.dart';

class TodoListView extends StatefulWidget {
  const TodoListView({super.key});
  static const routeName = '/';

  @override
  State<TodoListView> createState() => _TodoListViewState();
}

class _TodoListViewState extends State<TodoListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text(AppLocalizations.of(context)!.appTitle), actions: [
        IconButton(
            onPressed: () {
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
            icon: const Icon(Icons.settings))
      ]),
    );
  }
}
