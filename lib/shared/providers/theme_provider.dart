import 'package:flutter/material.dart';
import 'package:route_courses_app/shared/shared_prefs.dart';

class ThemeProvider extends ChangeNotifier{
  ThemeMode theme = ThemeMode.light;

  Future<void> changeTheme(ThemeMode newTheme)async{
    if(newTheme == theme){
      return;
    }
    theme = newTheme;
    SharedPrefs().setSharedPreferences(theme);
    notifyListeners();
  }

  Future<void> loadSettings() async{
    String? themeMode = await SharedPrefs().getSharedPreferences();

    themeMode ??= "light";
    theme = (themeMode == "dark")? ThemeMode.dark:ThemeMode.light;
  }
}