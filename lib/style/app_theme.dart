import 'package:flutter/material.dart';
import 'package:route_courses_app/style/app_colors.dart';

class AppTheme{
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.lightPrimaryColor,
      primary: AppColors.lightPrimaryColor,
    ),
    scaffoldBackgroundColor: Colors.white,
    textTheme: TextTheme(
      labelMedium: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 20,
        color: AppColors.lightPrimaryColor
      ),
      titleMedium: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w600,
        color: Colors.black
      ),
      labelSmall: TextStyle(
        color: AppColors.smallLabelColor,
        fontWeight: FontWeight.w600,
        fontSize: 14
      ),
      titleSmall: TextStyle(
        color: Colors.white,
        fontSize: 17,
        fontWeight: FontWeight.w600
      )
    )
  );

  static ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.darkPrimaryColor,
      primary: AppColors.darkPrimaryColor,
    ),
    scaffoldBackgroundColor: Color(0xff060E1E),
    textTheme: TextTheme(
      labelMedium: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
          color: AppColors.darkPrimaryColor
      ),
        titleMedium: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w600,
            color: Colors.white
        ),
      labelSmall: TextStyle(
          color: AppColors.smallLabelColor,
          fontWeight: FontWeight.w600,
          fontSize: 20
      ),
        titleSmall: TextStyle(
            color: Colors.black,
            fontSize: 17,
            fontWeight: FontWeight.w600
        )
    )
  );
}