import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:route_courses_app/layout/home/home_screen.dart';
import 'package:route_courses_app/layout/registration/registration_screen.dart';
import 'package:route_courses_app/model/firestore_user.dart';
import 'package:route_courses_app/shared/constants.dart';
import 'package:route_courses_app/shared/firebase/firestore_helper.dart';
import 'package:route_courses_app/shared/providers/auth_data_provider.dart';
import 'package:route_courses_app/shared/reusable_components/custom_text_field.dart';
import 'package:route_courses_app/shared/reusable_components/dialog_utils.dart';

import '../../shared/providers/theme_provider.dart';
import '../../style/app_colors.dart';

class LoginScreen extends StatefulWidget {
  static const String route = "LoginScreen";

  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isObscured = true;

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ThemeProvider provider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 45,horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image(image: AssetImage(provider.theme == ThemeMode.dark?"assets/images/dark_route_logo.png":"assets/images/light_route_logo.png")),
                  IconButton(
                    onPressed: (){
                      provider.changeTheme(provider.theme == ThemeMode.dark?ThemeMode.light:ThemeMode.dark);
                    },
                    icon: Icon(provider.theme == ThemeMode.dark?Icons.light_mode:Icons.dark_mode,size: 30,color: Theme.of(context).primaryColor,),
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
                    SizedBox(height: 10,),
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
                    SizedBox(height: 10,),
                    CustomTextField(
                      label: "Enter Your Password",
                      controller: passwordController,
                      keyboardType: TextInputType.text,
                      isObsecuredText: isObscured,
                      suffixIcon: IconButton(
                          onPressed: (){
                            setState(() {
                              isObscured = !isObscured;
                            });
                          },
                          icon: Icon(
                            isObscured?
                            Icons.visibility_off:
                            Icons.visibility,
                            size: 25,
                            color: AppColors.lightPrimaryColor,
                          )
                      ),
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return "This Field Is Required";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 25,),
                    ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                        backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor)
                      ),
                      onPressed: (){
                        login();
                      },
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
      ),
    );
  }

  void login() async{
    AuthDataProvider provider = Provider.of<AuthDataProvider>(context,listen: false);
    if(formKey.currentState?.validate()??false){
      try{
        DialogUtils.showLoading(context);
        UserCredential credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text
        );
        FirestoreUser? dataUser = await FirestoreHelper.getUser(credential.user!.uid);
        provider.setUsers(credential.user, dataUser);
        DialogUtils.hideMessage(context);
        DialogUtils.showMessage(context: context,
          message: "Logged In Successfully!",
          positiveText: "OK",
          positiveButton: (){
            Navigator.pushNamedAndRemoveUntil(context, HomeScreen.route, (route) => false);
          }
        );
      }on FirebaseException catch(error){
        if(error.code == Constants.userNotFound){
          print("user not found");
          DialogUtils.showMessage(
            context: context,
            message: "User Is Not Found",
            positiveText: "Try Again",
            positiveButton: (){
              DialogUtils.hideMessage(context);
              DialogUtils.hideMessage(context);
            },
          );
        }
        if(error.code == Constants.wrongPassword){
          print("wrong password");
          DialogUtils.showMessage(
            context: context,
            message: "Wrong Password",
            positiveText: "Try Again",
            positiveButton: (){
              DialogUtils.hideMessage(context);
              DialogUtils.hideMessage(context);
            },
          );
        }
      }catch(error){
        print(error);
      }
    }
  }
}
