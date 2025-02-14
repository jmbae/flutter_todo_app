import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsService {
  Future<ThemeMode> themeMode() async => ThemeMode.system;

  Future<void> updateThemeMode(ThemeMode theme) async {
    // Use the shared_preferences package to persist settings locally or the
    // http package to persist settings over the network.
  }

  Future<Locale> locale() async {
    final prefs = await SharedPreferences.getInstance();
    final locale = prefs.getString('locale');
    return Locale(locale ?? 'en');
  }

  Future<void> updateLocale(Locale locale) async {
    // Use the shared_preferences package to persist settings locally or the
    // http package to persist settings over the network.
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('locale', locale.languageCode);
  }
}
