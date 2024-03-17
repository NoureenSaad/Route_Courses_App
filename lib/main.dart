import 'package:flutter/material.dart';
import 'package:route_courses_app/layout/login/login_screen.dart';
import 'package:route_courses_app/layout/registration/registration_screen.dart';
import 'package:route_courses_app/style/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Route Courses App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: LoginScreen.route,
      routes: {
        LoginScreen.route:(_)=>LoginScreen(),
        RegistrationScreen.route:(_)=>RegistrationScreen(),
      },
    );
  }
}