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

  static void showMessage({
    required BuildContext context,
    required String message,
    String? positiveText,
    String? negativeText,
    void Function()? positiveButton,
    void Function()? negativeButton,
  }){
    showDialog(
        context: context,
        builder: (context) {
          return Material(
            color: Colors.transparent,
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(message,style: TextStyle(
                        color: AppColors.lightPrimaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w600
                    ),),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if(positiveText != null)
                          ElevatedButton(
                            onPressed: positiveButton,
                            child: Text(positiveText,style: TextStyle(
                                color: AppColors.lightPrimaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w300
                            ),)
                          ),
                        if(negativeText != null)
                          ElevatedButton(
                            onPressed: negativeButton,
                            child: Text(negativeText,style: TextStyle(
                              color: AppColors.lightPrimaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w300
                            ),)
                          ),
                      ],
                    )

                  ],
                ),
              ),
            ),
          );
        },
    );
  }

}