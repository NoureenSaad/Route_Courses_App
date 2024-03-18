import 'package:flutter/material.dart';
import 'package:route_courses_app/style/app_theme.dart';

class ThemeProvider extends ChangeNotifier{
  ThemeMode theme = ThemeMode.light;

  void changeTheme(ThemeMode newTheme){
    if(newTheme == theme){
      return;
    }
    theme = newTheme;
    notifyListeners();
  }

}