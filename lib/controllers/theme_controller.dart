import 'package:duvaai/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController {
  var isDarkTheme = false.obs;
  static const themeKey = 'isDarkTheme';

  ThemeData get lightTheme => AppTheme.lightTheme;
  ThemeData get darkTheme => AppTheme.darkTheme;

  ThemeMode get theme => isDarkTheme.value ? ThemeMode.dark : ThemeMode.light;

  @override
  void onInit() {
    super.onInit();
    loadThemeFromPrefs();
  }

  void toggleTheme() {
    isDarkTheme.value = !isDarkTheme.value;
    saveThemeToPrefs();
  }

  Future<void> loadThemeFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    isDarkTheme.value = prefs.getBool(themeKey) ?? false;
  }

  Future<void> saveThemeToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(themeKey, isDarkTheme.value);
  }
}
