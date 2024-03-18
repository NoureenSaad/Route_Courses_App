import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:route_courses_app/layout/home/home_screen.dart';
import 'package:route_courses_app/layout/login/login_screen.dart';
import 'package:route_courses_app/model/firestore_user.dart';
import 'package:route_courses_app/shared/firebase/firestore_helper.dart';
import 'package:route_courses_app/shared/providers/auth_data_provider.dart';
import 'package:route_courses_app/shared/reusable_components/dialog_utils.dart';
import '../../shared/constants.dart';
import '../../shared/providers/theme_provider.dart';
import '../../shared/reusable_components/custom_text_field.dart';
import '../../style/app_colors.dart';

class RegistrationScreen extends StatefulWidget {
  static const String route = "RegistrationScreen";

  RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isObscured = true;
  bool isConfirmationObscured = true;

  @override
  Widget build(BuildContext context) {
    AuthDataProvider provider = Provider.of<AuthDataProvider>(context);
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 45,horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image(image: AssetImage(themeProvider.theme == ThemeMode.dark?"assets/images/dark_route_logo.png":"assets/images/light_route_logo.png")),
                IconButton(
                  onPressed: (){
                    themeProvider.changeTheme(themeProvider.theme == ThemeMode.dark?ThemeMode.light:ThemeMode.dark);
                  },
                  icon: Icon(themeProvider.theme == ThemeMode.dark?Icons.light_mode:Icons.dark_mode,size: 30,color: Theme.of(context).primaryColor,),
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
                      Text("Create An Account",style: Theme.of(context).textTheme.titleMedium,),
                      Text("Connect With Your Friends Today!",style: Theme.of(context).textTheme.labelSmall,),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Text("Name",style: Theme.of(context).textTheme.labelMedium,),
                  SizedBox(height: 10,),
                  CustomTextField(
                    label: "Enter Your Name",
                    controller: nameController,
                    keyboardType: TextInputType.text,
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "This Field Is Required";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 15,),
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
                      else if(value.length < 8){
                        return "Password Can't Be Less Than 8 Characters";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 15,),
                  Text("Confirm Password",style: Theme.of(context).textTheme.labelMedium,),
                  SizedBox(height: 10,),
                  CustomTextField(
                    label: "Confirm Your Password",
                    controller: passwordConfirmationController,
                    keyboardType: TextInputType.text,
                    isObsecuredText: isConfirmationObscured,
                    suffixIcon: IconButton(
                        onPressed: (){
                          setState(() {
                            isConfirmationObscured = !isConfirmationObscured;
                          });
                        },
                        icon: Icon(
                          isConfirmationObscured?
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
                      else if(value != passwordController.text){
                        return "Password Doesn't Match";
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
                        registration();
                      },
                      child: Text("Registration",style: Theme.of(context).textTheme.titleSmall,)
                  ),
                  SizedBox(height: 25,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already Have An Account?",style: Theme.of(context).textTheme.labelSmall,),
                      SizedBox(width: 5,),
                      InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, LoginScreen.route);
                        },
                        child: Text("Login",style: Theme.of(context).textTheme.labelSmall?.copyWith(
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

  void registration() async{
    AuthDataProvider provider = Provider.of<AuthDataProvider>(context,listen: false);
    if(formKey.currentState?.validate()??false){
      DialogUtils.showLoading(context);
      try{
        UserCredential credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text
        );
        await FirestoreHelper.addUser(
            credential.user!.uid,
            nameController.text,
            emailController.text
        );
        DialogUtils.hideMessage(context);
        DialogUtils.showMessage(context: context,
          message: "Registered Successfully!",
          positiveText: "OK",
          positiveButton: (){
            provider.setUsers(credential.user,
                FirestoreUser(id: credential.user!.uid,
                    name: nameController.text,
                    email: emailController.text)
            );
            Navigator.pushNamedAndRemoveUntil(context, HomeScreen.route, (route) => false);
          }
        );
      }on FirebaseException catch(error){
        if(error.code == Constants.usedEmail){
          print("Email already used before");
          DialogUtils.showMessage(
            context: context,
            message: "Email Is Already in Use",
            positiveText: "Try Again",
            positiveButton: (){
              DialogUtils.hideMessage(context);
              DialogUtils.hideMessage(context);
            },
          );
        }
        if(error.code == Constants.weakPassword){
          print("Weak password");
          DialogUtils.showMessage(
            context: context,
            message: "Password Is Weak",
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
