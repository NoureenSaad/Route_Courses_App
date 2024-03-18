import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:route_courses_app/layout/home/widgets/best_selling_courses_widget.dart';
import 'package:route_courses_app/layout/home/widgets/featured_courses_widget.dart';
import 'package:route_courses_app/layout/login/login_screen.dart';
import 'package:route_courses_app/shared/providers/auth_data_provider.dart';

import '../../shared/providers/theme_provider.dart';

class HomeScreen extends StatefulWidget {
  static const String route = "HomeScreen";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    AuthDataProvider authDataProvider = Provider.of<AuthDataProvider>(context);
    ThemeProvider provider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20,bottom: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image(image: AssetImage(provider.theme == ThemeMode.dark?"assets/images/dark_route_logo.png":"assets/images/light_route_logo.png"),width: 80,),
                      SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Welcome To Route",style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w300,
                            fontSize: 16
                          )),
                          Text("Enjoy Our Courses!",style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w300,
                            fontSize: 14
                          )),
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: (){
                          provider.changeTheme(provider.theme == ThemeMode.dark?ThemeMode.light:ThemeMode.dark);
                        },
                        icon: Icon(provider.theme == ThemeMode.dark?Icons.light_mode:Icons.dark_mode,color: Theme.of(context).colorScheme.primary,)
                      ),
                      IconButton(
                          onPressed: ()async{
                            await authDataProvider.signOut();
                            Navigator.pushNamedAndRemoveUntil(context, LoginScreen.route, (route) => false);
                          },
                          icon: Icon(Icons.logout,color: Theme.of(context).colorScheme.primary)
                      ),
                    ],
                  )
                ],
              ),
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Featured ",style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  fontSize: 25
                ),),
                Text("Courses",style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  fontSize: 25
                ),)
              ],
            ),
            SizedBox(height: 20,),
            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  FeaturedCoursesWidget(courseName: "Flutter Diploma", studentsNumber: "50"),
                  SizedBox(width: 15,),
                  FeaturedCoursesWidget(courseName: "Android Diploma", studentsNumber: "15"),
                  SizedBox(width: 15,),
                  FeaturedCoursesWidget(courseName: "Frontend Diploma", studentsNumber: "20"),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Best Selling ",style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    fontSize: 25
                ),),
                Text("Courses",style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    fontSize: 25
                ),)
              ],
            ),
            Expanded(
              child: ListView(
                children: [
                  BestSellingCoursesWidget(courseName: "Flutter Basics Diploma", studentsNumber: "20"),
                  SizedBox(height: 15,),
                  BestSellingCoursesWidget(courseName: "Android Kotlin Diploma", studentsNumber: "15"),
                  SizedBox(height: 15,),
                  BestSellingCoursesWidget(courseName: "Full-Stack Development\nDiploma", studentsNumber: "30"),
                ],
              ))
          ],
        ),
      ),
    );
  }
}
