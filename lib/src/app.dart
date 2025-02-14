import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'settings/settings_controller.dart';
import 'settings/settings_view.dart';

import 'todo_list/todo_list_view.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.settingsController,
  });

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          restorationScopeId: 'app',
          localizationsDelegates: const [
            // 앱에서 사용하는 지역화 문자열을 찾는 데 사용됩니다.
            AppLocalizations.delegate,

            // Flutter에서 제공하는 기본적인 위젯들의 다국어 지원을 위한 delegate입니다.
            // Material Design 위젯 (예: ElevatedButton, TextField)의 텍스트를 번역합니다.
            // (예: "OK", "Cancel" 버튼의 텍스트, 달력의 요일 이름 등)
            GlobalMaterialLocalizations.delegate,

            // Flutter 위젯들의 일반적인 텍스트 (Material Design 이외의 부분)를 위한 delegate입니다.
            // 플랫폼에 따른 텍스트 방향 (LTR/RTL) 설정 등을 처리합니다.
            GlobalWidgetsLocalizations.delegate,

            // Cupertino (iOS 스타일) 위젯들의 다국어 지원을 위한 delegate입니다.
            // CupertinoAlertDialog, CupertinoDatePicker 등의 위젯에 사용되는 텍스트를 번역합니다.
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''),
            Locale('ko', ''),
          ],
          locale: settingsController.locale,
          onGenerateTitle: (BuildContext context) =>
              AppLocalizations.of(context)!.appTitle,
          theme: ThemeData(),
          darkTheme: ThemeData.dark(),
          themeMode: settingsController.themeMode,
          onGenerateRoute: (RouteSettings routeSettings) {
            return MaterialPageRoute<void>(
              settings: routeSettings,
              builder: (BuildContext context) {
                switch (routeSettings.name) {
                  case SettingsView.routeName:
                    return SettingsView(controller: settingsController);
                  case TodoListView.routeName:
                    return const TodoListView();
                  default:
                    return const TodoListView();
                }
              },
            );
          },
        );
      },
    );
  }
}
