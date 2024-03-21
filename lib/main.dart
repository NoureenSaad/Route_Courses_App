import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:route_courses_app/layout/home/home_screen.dart';
import 'package:route_courses_app/layout/login/login_screen.dart';
import 'package:route_courses_app/layout/registration/registration_screen.dart';
import 'package:route_courses_app/layout/splash/splash_screen.dart';
import 'package:route_courses_app/shared/providers/auth_data_provider.dart';
import 'package:route_courses_app/shared/providers/theme_provider.dart';
import 'package:route_courses_app/shared/shared_prefs.dart';
import 'package:route_courses_app/style/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPrefs.prefs = await SharedPreferences.getInstance();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthDataProvider>(create: (_)=>AuthDataProvider(),),
        ChangeNotifierProvider<ThemeProvider>(create: (_)=>ThemeProvider()..loadSettings(),),
      ],
      child: const MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider provider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      title: 'Route Courses App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: provider.theme,
      initialRoute: SplashScreen.route,
      routes: {
        LoginScreen.route:(_)=>LoginScreen(),
        RegistrationScreen.route:(_)=>RegistrationScreen(),
        HomeScreen.route:(_)=>HomeScreen(),
        SplashScreen.route:(_)=>SplashScreen(),
      },
    );
  }
}