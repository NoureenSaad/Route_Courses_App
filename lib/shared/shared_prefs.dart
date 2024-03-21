import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs{
  static late SharedPreferences prefs;

  Future<void> setSharedPreferences(ThemeMode newTheme)async{
    await prefs.setString("theme", newTheme.name);
  }

  Future<String?> getSharedPreferences()async{
    final String? appTheme = prefs.getString("theme");
    return appTheme;
  }
}