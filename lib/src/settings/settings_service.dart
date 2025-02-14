import 'package:flutter/material.dart';

class SettingsService {
  Future<ThemeMode> themeMode() async => ThemeMode.system;

  Future<void> updateThemeMode(ThemeMode theme) async {
    // Use the shared_preferences package to persist settings locally or the
    // http package to persist settings over the network.
  }

  Future<Locale> locale() async => Locale('en');

  Future<void> updateLocale(Locale locale) async {
    // Use the shared_preferences package to persist settings locally or the
    // http package to persist settings over the network.
  }
}
