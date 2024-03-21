import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:route_courses_app/layout/home/home_screen.dart';
import 'package:route_courses_app/layout/login/login_screen.dart';
import 'package:route_courses_app/shared/providers/auth_data_provider.dart';
import 'package:route_courses_app/shared/providers/theme_provider.dart';

class SplashScreen extends StatelessWidget {
  static const String route = "SplashScreen";
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider provider = Provider.of<ThemeProvider>(context);
    Future.delayed(Duration(seconds: 3),() {
      checkLogIn(context);
    },);
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        image: DecorationImage(image: AssetImage(provider.theme == ThemeMode.dark?"assets/images/dark_route_logo.png":"assets/images/light_route_logo.png"))
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
      ),
    );
  }

  void checkLogIn(context)async{
    AuthDataProvider authDataProvider = Provider.of<AuthDataProvider>(context,listen: false);
    if(authDataProvider.isLoggedIn()){
      await authDataProvider.retrieveDatabaseUserData();
      Navigator.pushReplacementNamed(context, HomeScreen.route);
    }
    else{
      Navigator.pushReplacementNamed(context, LoginScreen.route);
    }
  }
}
