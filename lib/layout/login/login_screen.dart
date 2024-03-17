import 'package:flutter/material.dart';
import 'package:route_courses_app/layout/registration/registration_screen.dart';
import 'package:route_courses_app/shared/constants.dart';
import 'package:route_courses_app/shared/reusable_components/custom_text_field.dart';

import '../../style/app_colors.dart';

class LoginScreen extends StatelessWidget {
  static const String route = "LoginScreen";
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 45,horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image(image: AssetImage("assets/images/route_logo.png")),
                IconButton(
                  onPressed: (){

                  },
                  icon: Icon(Icons.dark_mode,size: 30,color: Theme.of(context).primaryColor,),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Hi, Welcome Back!",style: Theme.of(context).textTheme.titleMedium,),
                      Text("Hello Again, You've Been Missed!",style: Theme.of(context).textTheme.labelSmall,),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Text("Email Address",style: Theme.of(context).textTheme.labelMedium,),
                  SizedBox(height: 5,),
                  CustomTextField(
                    label: "Enter Your Email",
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "This Field Is Required";
                      }
                      else if(!RegExp(Constants.emailRegex).hasMatch(value)){
                        return "Enter A Valid Email";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 15,),
                  Text("Password",style: Theme.of(context).textTheme.labelMedium,),
                  SizedBox(height: 5,),
                  CustomTextField(
                    label: "Enter Your Password",
                    controller: passwordController,
                    keyboardType: TextInputType.text,
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "This Field Is Required";
                      }
                      else if(value.length < 8){
                        return "Password Can't Be Less Than 8 Characters";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 15,),
                  ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                      backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor)
                    ),
                    onPressed: (){},
                    child: Text("Login",style: Theme.of(context).textTheme.titleSmall,)
                  ),
                  SizedBox(height: 25,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't Have An Account?",style: Theme.of(context).textTheme.labelSmall,),
                      SizedBox(width: 5,),
                      InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, RegistrationScreen.route);
                        },
                        child: Text("Sign Up",style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: AppColors.lightPrimaryColor
                        )),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
