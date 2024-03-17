import 'package:flutter/material.dart';
import 'package:route_courses_app/style/app_colors.dart';

class DialogUtils{

  static void showLoading(BuildContext context){
    showDialog(
      context: context,
      builder: (context) {
        return Material(
          color: Colors.transparent,
          child: Center(
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator.adaptive(),
                  SizedBox(height: 5,),
                  Text("Loading",style: TextStyle(
                    color: AppColors.lightPrimaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w500
                  ),),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static void hideMessage(BuildContext context){
    Navigator.pop(context);
  }

  static void showMessage(BuildContext context,
      String message,

      ){
    showDialog(
        context: context,
        builder: (context) {
          return Material(
            child: Center(
              child: Column(
                children: [

                ],
              ),
            ),
          );
        },
    );
  }

}